import 'package:firstdemo/view/calculator_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Styled Calculator'),
        centerTitle: true,
      ),
      body: const SafeArea(child: CalculatorView()),
    );
  }
}
