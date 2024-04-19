import 'package:flutter/material.dart';

class SecondScreenView extends StatefulWidget {
  final bool isCameraEnabled;
  final bool isEmployeesEnabled;
  final bool isNameEnabled;
  final bool isPhoneEnabled;
  final bool isBirthdateEnabled;
  final bool isGenderEnabled;
  final bool isColorEnabled;

  const SecondScreenView(
      {super.key,
      required this.isCameraEnabled,
      required this.isEmployeesEnabled,
      required this.isNameEnabled,
      required this.isPhoneEnabled,
      required this.isBirthdateEnabled,
      required this.isGenderEnabled,
      required this.isColorEnabled});

  @override
  State<SecondScreenView> createState() => _SecondScreenViewState();
}

class _SecondScreenViewState extends State<SecondScreenView> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
