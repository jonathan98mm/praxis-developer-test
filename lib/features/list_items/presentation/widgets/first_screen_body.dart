import 'package:flutter/material.dart';
import 'package:praxis_developer_test/core/resources/screen_arguments.dart';

class FirstScreenBody extends StatefulWidget {
  const FirstScreenBody({super.key});

  @override
  State<FirstScreenBody> createState() => _FirstScreenBodyState();
}

class _FirstScreenBodyState extends State<FirstScreenBody> {
  bool isCameraEnabled = false;
  bool isEmployeesEnabled = false;
  bool isNameEnabled = false;
  bool isPhoneEnabled = false;
  bool isBirthdateEnabled = false;
  bool isGenderEnabled = false;
  bool isColorEnabled = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CheckboxListTile(
            value: isCameraEnabled,
            title: const Text("Cámara"),
            onChanged: (bool? value) => setState(
              () {
                isCameraEnabled = value!;
              },
            ),
          ),
          CheckboxListTile(
            value: isEmployeesEnabled,
            title: const Text("Lista de empleados"),
            onChanged: (bool? value) => setState(
              () {
                isEmployeesEnabled = value!;
              },
            ),
          ),
          CheckboxListTile(
            value: isNameEnabled,
            title: const Text("Nombre completo"),
            onChanged: (bool? value) => setState(
              () {
                isNameEnabled = value!;
              },
            ),
          ),
          CheckboxListTile(
            value: isPhoneEnabled,
            title: const Text("Número telefónico"),
            onChanged: (bool? value) => setState(
              () {
                isPhoneEnabled = value!;
              },
            ),
          ),
          CheckboxListTile(
            value: isBirthdateEnabled,
            title: const Text("Fecha de nacimiento"),
            onChanged: (bool? value) => setState(
              () {
                isBirthdateEnabled = value!;
              },
            ),
          ),
          CheckboxListTile(
            value: isGenderEnabled,
            title: const Text("Sexo (Masculino / Femenino)"),
            onChanged: (bool? value) => setState(
              () {
                isGenderEnabled = value!;
              },
            ),
          ),
          CheckboxListTile(
            value: isColorEnabled,
            title: const Text("Color favorito"),
            onChanged: (bool? value) => setState(
              () {
                isColorEnabled = value!;
              },
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () => _onButtonPressed(context),
            child: const Text("Segunda pantalla"),
          )
        ],
      ),
    );
  }

  void _onButtonPressed(BuildContext context) {
    if (isCameraEnabled ||
        isEmployeesEnabled ||
        isNameEnabled ||
        isPhoneEnabled ||
        isBirthdateEnabled ||
        isGenderEnabled ||
        isColorEnabled) {
      Navigator.pushNamed(context, "/SecondScreen",
          arguments: ScreenArguments(isCameraEnabled, isEmployeesEnabled, isNameEnabled, isPhoneEnabled,
              isBirthdateEnabled, isGenderEnabled, isColorEnabled));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Debes seleccionar al menos una opción",
            style: TextStyle(fontSize: 18),
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
