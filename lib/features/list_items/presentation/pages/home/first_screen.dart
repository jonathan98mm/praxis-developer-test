import 'package:flutter/material.dart';
import 'package:praxis_developer_test/features/list_items/presentation/widgets/first_screen_body.dart';

class FirstScreenView extends StatefulWidget {
  const FirstScreenView({super.key});

  @override
  State<FirstScreenView> createState() => _FirstScreenViewState();
}

class _FirstScreenViewState extends State<FirstScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: const FirstScreenBody(),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: const Text(
        "Praxis Developer Test",
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
      ),
    );
  }
}
