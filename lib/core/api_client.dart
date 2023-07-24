import 'package:dio/dio.dart';

abstract class ApiClient {
  final Dio _dio = Dio();

  ApiClient() {
    _dio.options.headers['content-type'] = 'application/json';
// _dio.options.baseUrl = 'https://tim0.cvpagia.site/api/';
    _dio.options.baseUrl = 'http://10.0.2.2:8000/api/';
// _dio.options.baseUrl = 'https://tim-zero.ti4mb.top/api/';
  }
  Dio get dio => _dio;
}
