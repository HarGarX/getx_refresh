import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'http_service.dart';

const BASE_URL = "https://newsapi.org/v2/";
const API_KEY = "e18d7ba8fb804c9f89589b0801ec1b87";

class HttpServiceImpl implements HttpService {
  late Dio _dio;

  @override
  Future<Response> getRequest(String url) async {
    Response response;

    try {
      response = await _dio.get(url);
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
    _dio = Dio(BaseOptions(
      baseUrl: BASE_URL,
      headers: {"Authorization": "Bearer $API_KEY"},
    ));

    initializeInterceptors();
  }
}
