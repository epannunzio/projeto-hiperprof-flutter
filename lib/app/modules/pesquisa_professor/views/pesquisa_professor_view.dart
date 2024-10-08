import 'package:flutter/material.dart';
import 'package:hiperprooftwo/app/components/hp_text_form_search.dart';
import 'package:hiperprooftwo/app/modules/pesquisa_professor/components/card_lista_profe.dart';
import 'package:hiperprooftwo/app/modules/pesquisa_professor/controller/pesquisa_professor_controller.dart';
import 'package:hiperprooftwo/data/models/professor_model.dart';

class PesquisaProfessorView extends StatefulWidget {
  final String searchProfessor;
  const PesquisaProfessorView({super.key, required this.searchProfessor});

  @override
  State<PesquisaProfessorView> createState() => _PesquisaProfessorViewState();
}

class _PesquisaProfessorViewState extends State<PesquisaProfessorView> {
  late final controller = PesquisaProfessorController(
    onNavigatorProfessor: (route, professor) =>
        Navigator.pushNamed(context, route, arguments: professor),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              HpTextFormSearch(
                controller: TextEditingController(),
                label: 'Pesquisa Profe',
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                onChanged: (value) {
                  controller.onSearchDebounce(value);
                },
              ),
              FutureBuilder<List<Professor>>(
                future: controller.getAllProfessor(widget.searchProfessor),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return AnimatedBuilder(
                      animation: controller,
                      builder: (context, child) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.72,
                          child: ListView.builder(
                            itemCount: controller.professores.length,
                            itemBuilder: (context, i) {
                              final professor = controller.professores[i];
                              return CardListaProfe(
                                professor: professor,
                              );
                            },
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Erro inesperado: ${snapshot.error}'),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
