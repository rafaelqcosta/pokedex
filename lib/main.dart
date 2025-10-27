import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app_module.dart';
import 'package:pokedex/app_widget.dart';

void main() async {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://pokeapi.co/api/v2/',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  try {
    final res = await dio.get('pokemon?limit=1');
    print(res.data);
  } catch (e) {
    print('Erro: $e');
  }
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: AppTheme.light,
//       darkTheme: AppTheme.dark,
//       themeMode: ThemeMode.system,
//       home:
//     );
//   }
// }
