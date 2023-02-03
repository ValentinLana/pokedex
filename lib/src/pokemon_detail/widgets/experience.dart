import 'package:flutter/material.dart';

class Experience extends StatelessWidget {
  const Experience({Key? key, required this.experience}) : super(key: key);

  final int experience;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$experience Exp',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20,
            color: Color.fromARGB(255, 118, 116, 116),
          ),
        )
      ],
    );
  }
}
