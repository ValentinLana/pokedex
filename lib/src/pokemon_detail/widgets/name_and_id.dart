import 'package:flutter/material.dart';
import 'package:pokemon_flutter_app/src/helpers/capitalize.dart';

class NameAndId extends StatelessWidget {
  const NameAndId({Key? key, required this.name, required this.id})
      : super(key: key);

  final String name;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '#$id',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 28,
            color: Color.fromARGB(255, 118, 116, 116),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          name.capitalize(),
          textAlign: TextAlign.start,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 23,
            color: Color.fromARGB(255, 118, 116, 116),
          ),
        ),
      ],
    );
  }
}
