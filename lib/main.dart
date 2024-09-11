import 'package:flutter/material.dart';
import 'package:hiperprooftwo/app/modules/inicial/views/initial_view.dart';
import 'package:hiperprooftwo/app/modules/pesquisa_professor/views/pesquisa_professor_view.dart';
import 'package:hiperprooftwo/routes.dart';
import 'package:hiperprooftwo/theme/theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: CustomThemeData.ligth(),
      darkTheme: CustomThemeData.dark(),
      themeMode: ThemeMode.system,
      onGenerateRoute: (routeSettings) {
        if (routeSettings.name == Routes.PESQUISA_PROFESSOR) {
          final searchProfessor = routeSettings.arguments as String;

          return MaterialPageRoute(
            builder: (context) => PesquisaProfessorView(
              searchProfessor: searchProfessor,
            ),
          );
        }
      },
      routes: {
        Routes.INICIAL: (context) => const InitialView(),
      },
    );
  }
}
