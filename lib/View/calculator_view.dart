import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  final displayOneController = TextEditingController();
  final displayTwoController = TextEditingController();
  num? result;

  @override
  void dispose() {
    displayOneController.dispose();
    displayTwoController.dispose();
    super.dispose();
  }

  num _parse(String v) => num.tryParse(v.trim()) ?? 0;

  void _compute(num Function(num a, num b) op) {
    final a = _parse(displayOneController.text);
    final b = _parse(displayTwoController.text);
    setState(() => result = op(a, b));
  }

  @override
  Widget build(BuildContext context) {
    final gap = const SizedBox(height: 12);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          CalculatorDisplay(
            hint: 'Enter first number',
            controller: displayOneController,
          ),
          gap,
          CalculatorDisplay(
            hint: 'Enter second number',
            controller: displayTwoController,
          ),
          gap,
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.orange.withOpacity(0.08),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              result == null ? 'Result will appear here' : '$result',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Spacer(),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _CalcFab(icon: CupertinoIcons.add, onTap: () => _compute((a, b) => a + b)),
              _CalcFab(icon: CupertinoIcons.minus, onTap: () => _compute((a, b) => a - b)),
              _CalcFab(icon: CupertinoIcons.multiply, onTap: () => _compute((a, b) => a * b)),
              _CalcFab(icon: CupertinoIcons.divide, onTap: () => _compute((a, b) => b == 0 ? 0 : a / b)),
            ],
          ),
          gap,
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                displayOneController.clear();
                displayTwoController.clear();
                setState(() => result = null);
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Clear'),
            ),
          ),
        ],
      ),
    );
  }
}

class _CalcFab extends StatelessWidget {
  const _CalcFab({required this.icon, required this.onTap});
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: icon.codePoint,
      onPressed: onTap,
      child: Icon(icon),
    );
  }
}

class CalculatorDisplay extends StatelessWidget {
  const CalculatorDisplay({
    super.key,
    this.hint = 'Enter a number',
    required this.controller,
  });

  final String hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: const Icon(Icons.calculate_outlined),
      ),
    );
  }
}
