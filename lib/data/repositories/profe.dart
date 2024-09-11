import 'package:dio/dio.dart';
import 'package:hiperprooftwo/data/provider/client_api.dart';

class ProfeRepository {
  final ClientApi _clientApi = ClientApi();

  Future<Response<T>> getAll<T>(String? search) async {
    return await _clientApi.get('/professores', query: {'q': search});
  }
}
