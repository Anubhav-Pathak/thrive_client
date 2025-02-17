import 'package:flutter/material.dart';
import 'package:thrive_client/core/router/route_generator.dart';
import 'package:thrive_client/core/router/routes.dart';
import 'package:thrive_client/core/utils/injections.dart';

void main() async {
  await initInjections();
  runApp(
    const Thrive(),
  );
}

class Thrive extends StatelessWidget {
  const Thrive({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: Routes.discover,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
