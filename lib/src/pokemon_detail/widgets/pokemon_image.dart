import 'package:flutter/material.dart';

class PokemonImage extends StatelessWidget {
  const PokemonImage({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: const Color.fromARGB(138, 255, 255, 255),
      radius: 90,
      child: Image.network(
        'https://pokemon.gishan.cc/static/i/p/$name.png',
      ),
    );
  }
}
