import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hiperprooftwo/app/modules/pesquisa_professor/service/pesquisa_professor_service.dart';
import 'package:hiperprooftwo/data/models/professor_model.dart';
import 'package:hiperprooftwo/routes.dart';

class PesquisaProfessorController extends ChangeNotifier {
  final PesquisaProfessorService _service = PesquisaProfessorService();
  final Function(String route, Professor professor) onNavigatorProfessor;
  Timer? _debounce;
  List<Professor> professores = [];

  PesquisaProfessorController({required this.onNavigatorProfessor});

  void selectProfessor(Professor professor) {
    onNavigatorProfessor(Routes.DETALHE_PROFESSOR, professor);
  }

  Future<List<Professor>> getAllProfessor(String? search) async {
    try {
      professores = await _service.getAllProfessores(search);
      return professores;
    } catch (e) {
      rethrow;
    }
  }

  void onSearchDebounce(String? search) {
    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    }
    _debounce = Timer(const Duration(milliseconds: 500), () {
      getAllProfessor(search);
    });
  }
}
