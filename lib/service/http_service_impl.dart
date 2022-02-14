import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'http_service.dart';

const BASE_URL = "https://newsapi.org/v2/";
const API_KEY = "e18d7ba8fb804c9f89589b0801ec1b87";

class HttpServiceImpl implements HttpService {
  late Dio _dio = Dio();

  @override
  Future<Response> getRequest(String url) async {
    Response response;

    try {
      print('res');
      response = await _dio.get(url);
      print('res2');

      print(response);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  initializeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (e, handler) {
        print(e.message);
      },
      onRequest: (options, handler) {
        print("${options.method} || ${options.path}");
      },
      onResponse: (response, handler) {
        print(
            "${response.statusCode} || ${response.statusMessage} || ${response.data}");
      },
    ));
  }

  @override
  void init() {
    _dio = Dio(
      BaseOptions(
        connectTimeout: 5000,
        baseUrl: BASE_URL,
        headers: {"Authorization": "Bearer $API_KEY"},
      ),
    )..interceptors.add(Logging());

    // initializeInterceptors();
  }
}

class Logging extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('REQUEST[${options.method}] => PATH: ${options.path}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );
    return super.onError(err, handler);
  }
}
