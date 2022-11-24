import 'package:dio/dio.dart';
import 'package:web_proyecto_final/services/local_storage.dart';

class ProFinApi {
  static final Dio _dio = Dio();

  static void configureDio() {
    //Base de url
    _dio.options.baseUrl = 'http://localhost:3000/api/v1';

    // Configurar Headers
    _dio.options.headers = {
      'x-token': LocalStorage.prefs.getString('token') ?? ''
    };
    _dio.options.headers['content-Type'] = 'application/json;charSet=UTF-8';
  }

  static Future httpGet(String path) async {
    try {
      final resp = await _dio.get(path);

      return resp.data;
    } on DioError {
      throw ('Error en el GET');
    }
  }

  static Future post(String path, Map<String, dynamic> data) async {
    try {
      final resp = await _dio.post(path, data: data);
      return resp.data;
    } on DioError {
      throw ('Error en el POST');
    }
  }

  static Future put(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);

    try {
      final resp = await _dio.put(path, data: formData);
      return resp.data;
    } on DioError catch (e) {
      throw ('Error en el PUT $e');
    }
  }

  static Future delete(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);

    try {
      final resp = await _dio.delete(path, data: formData);
      return resp.data;
    } on DioError {
      throw ('Error en el delete');
    }
  }
}
