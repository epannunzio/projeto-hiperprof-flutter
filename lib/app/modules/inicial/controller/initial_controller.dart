import 'package:flutter/material.dart';
import 'package:hiperprooftwo/routes.dart';

class InitialController {
  final bool Function() isValidForm;
  final Function(String route, String search) onNavigatorProfe;
  final searchController = TextEditingController();

  InitialController(
      {required this.isValidForm, required this.onNavigatorProfe});

  String? validateSearch(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Digite o que deseja aprender';
    }

    return null;
  }

  void buscarProfe() {
    final isValid = isValidForm();

    if (isValid) {
      onNavigatorProfe(Routes.PESQUISA_PROFESSOR, searchController.text);
    }
  }

  void sejaUmProfe() {}
  void consultarAula() {}
}
