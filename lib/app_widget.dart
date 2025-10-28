import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

ValueNotifier<bool> isMobile = ValueNotifier(false);

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
            isMobile.value = constraints.maxWidth < 840;
            print(constraints.maxWidth);
            return child!;
          },
        );
      },
    );
  }
}
