import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hiperprooftwo/data/models/professor_model.dart';
import 'package:hiperprooftwo/data/repositories/profe.dart';

class PesquisaProfessorService {
  final ProfeRepository _professorRepository = ProfeRepository();

  Future<List<Professor>> getAllProfessores(String? search) async {
    try {
      final response = await _professorRepository.getAll(search);
      final professores = (response.data as List)
          .map((json) => Professor.fromJson(json))
          .toList();

      return professores;
    } on DioException catch (erro, s) {
      log('Erro ao buscar professores', error: erro, stackTrace: s);
      if (erro.response != null) {
        throw erro.response!.data['message'];
      }
      throw 'Erro ao buscar professores';
    } catch (erro, s) {
      log('Erro ao buscar professores', error: erro, stackTrace: s);
      throw 'Erro ao buscar professores';
    }
  }
}
