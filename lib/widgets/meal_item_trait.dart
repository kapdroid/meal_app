import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait(this.icon, this.label, {super.key});

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
