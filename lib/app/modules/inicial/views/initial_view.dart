import 'package:flutter/material.dart';
import 'package:hiperprooftwo/app/components/hp_elevated_buttom.dart';
import 'package:hiperprooftwo/app/components/hp_outlined_buttom.dart';
import 'package:hiperprooftwo/app/components/hp_text_form_search.dart';
import 'package:hiperprooftwo/app/components/hp_text_title.dart';
import 'package:hiperprooftwo/app/modules/inicial/controller/initial_controller.dart';

class InitialView extends StatefulWidget {
  const InitialView({super.key});

  @override
  State<InitialView> createState() => _InitialViewState();
}

class _InitialViewState extends State<InitialView> {
  final _key = GlobalKey<FormState>();
  late final _mediaQuery = MediaQuery.of(context);
  late final controller = InitialController(
    isValidForm: () => _key.currentState?.validate() ?? false,
    onNavigatorProfe: (route, search) =>
        Navigator.pushNamed(context, route, arguments: search),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          height: _mediaQuery.size.height - _mediaQuery.padding.top,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _key,
                  child: Column(
                    children: [
                      const HpTextTitle(
                        text: 'Encontre seu profe aqui',
                        size: HPSizeTitle.large,
                      ),
                      HpTextFormSearch(
                        controller: controller.searchController,
                        validator: controller.validateSearch,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                      ),
                      HpElevatedButtom(
                        onPressed: controller.buscarProfe,
                        child: const Text('Buscar profe'),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 60, right: 60, bottom: 20),
                child: Column(
                  children: [
                    HpElevatedButtom(
                      onPressed: controller.sejaUmProfe,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColorLight,
                      ),
                      child: const Text('Seja um profe'),
                    ),
                    HpOutlinedButtom(
                      onPressed: controller.consultarAula,
                      child: const Text('Consultar minhas aulas'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
