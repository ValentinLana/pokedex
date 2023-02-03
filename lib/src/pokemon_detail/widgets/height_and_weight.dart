import 'package:flutter/material.dart';

class HeightAndWeight extends StatelessWidget {
  const HeightAndWeight({Key? key, required this.height, required this.weight})
      : super(key: key);

  final int? height;
  final int? weight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text(
              '${height! / 10} m',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 15,
                color: Color.fromARGB(221, 39, 38, 38),
              ),
            ),
            const SizedBox(height: 2),
            const Text(
              'Height',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: Color.fromARGB(221, 39, 38, 38),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              '${weight! / 10} kg',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 15,
                color: Color.fromARGB(221, 39, 38, 38),
              ),
            ),
            const SizedBox(height: 2),
            const Text(
              'Weight',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: Color.fromARGB(221, 39, 38, 38),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
