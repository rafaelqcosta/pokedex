import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/core/constants/constants.dart';

ValueNotifier<bool> isMobile = ValueNotifier(false);
double bottomSheetMaxWidth = 640;

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Pokedex',
      theme: ThemeData.light(),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,

      builder: (context, child) {
        return LayoutBuilder(
          builder: (context, constraints) {
            isMobile.value = constraints.maxWidth < wideScreen;
            bottomSheetMaxWidth = constraints.maxWidth >= 640 ? 640 : bottomSheetWidth;
            print(constraints.maxWidth);
            return child!;
          },
        );
      },
    );
  }
}
