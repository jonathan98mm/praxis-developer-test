import 'package:flutter/material.dart';

class SecondScreenBody extends StatefulWidget {
  const SecondScreenBody({super.key});

  @override
  State<SecondScreenBody> createState() => _SecondScreenBodyState();
}

class _SecondScreenBodyState extends State<SecondScreenBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView();
  }
}
