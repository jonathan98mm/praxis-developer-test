import 'package:flutter/material.dart';
import 'package:praxis_developer_test/core/resources/screen_arguments.dart';
import 'package:praxis_developer_test/features/list_items/presentation/pages/home/first_screen.dart';
import 'package:praxis_developer_test/features/list_items/presentation/pages/second_screen.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => const FirstScreenView());

      case "/SecondScreen":
        return MaterialPageRoute(builder: (_) {
          ScreenArguments args = settings.arguments as ScreenArguments;
          return SecondScreenView(
            isCameraEnabled: args.isCameraEnabled,
            isEmployeesEnabled: args.isEmployeesEnabled,
            isNameEnabled: args.isNameEnabled,
            isPhoneEnabled: args.isPhoneEnabled,
            isBirthdateEnabled: args.isBirthdateEnabled,
            isGenderEnabled: args.isGenderEnabled,
            isColorEnabled: args.isColorEnabled,
          );
        });

      default:
        return MaterialPageRoute(builder: (_) => const FirstScreenView());
    }
  }
}
