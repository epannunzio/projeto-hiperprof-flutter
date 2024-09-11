import 'package:dio/dio.dart';
import 'package:hiperprooftwo/data/provider/rest_interface.dart';

class ClientApi implements Rest {
  final Dio _dio = Dio();
  final _baseUrl = 'https://alunos.treinaweb.com.br/hyperproof/api';

  ClientApi() {
    _dio.options.baseUrl = _baseUrl;
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    _dio.options.connectTimeout = const Duration(seconds: 15);
    _dio.options.receiveTimeout = const Duration(seconds: 15);
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        return handler.next(e);
      },
    ));
  }

  @override
  Future<Response<T>> delete<T>(String path) async {
    return await _dio.delete(path);
  }

  @override
  Future<Response<T>> get<T>(String path, {Map<String, dynamic>? query}) async {
    try {
      return await _dio.get(path, queryParameters: query);
    } on DioException catch (e) {
      if (e.response != null) {
        throw 'Erro: ${e.response!.statusCode} - ${e.response!.data}';
      } else {
        throw 'Erro na requisição: ${e.message}';
      }
    }
  }

  @override
  Future<Response<T>> post<T>(String path, {required data}) async {
    return await _dio.post(path, data: data);
  }

  @override
  Future<Response<T>> put<T>(String path, {required data}) async {
    return await _dio.put(path, data: data);
  }
}
