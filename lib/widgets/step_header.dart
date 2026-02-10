import 'package:flutter/material.dart';

class StepHeader extends StatelessWidget {
  final int step;

  const StepHeader({super.key, required this.step});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Step $step of 13',
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 6),
        LinearProgressIndicator(
          value: step / 13,
          backgroundColor: Colors.grey.shade300,
          color: Colors.black,
          minHeight: 3,
        ),
      ],
    );
  }
}
