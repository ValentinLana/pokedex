import 'package:flutter/material.dart';
import 'package:pokemon_flutter_app/src/pokemon_detail/models/pokemon_detail.dart';
import 'package:pokemon_flutter_app/src/pokemon_detail/widgets/experience.dart';
import 'package:pokemon_flutter_app/src/pokemon_detail/widgets/height_and_weight.dart';
import 'package:pokemon_flutter_app/src/pokemon_detail/widgets/name_and_id.dart';
import 'package:pokemon_flutter_app/src/pokemon_detail/widgets/pokemon_image.dart';
import 'package:pokemon_flutter_app/src/pokemon_detail/widgets/stats.dart';
import 'package:pokemon_flutter_app/src/pokemon_detail/widgets/type_and_ability.dart';
import 'package:pokemon_flutter_app/src/pokemon_list/models/pokemon.dart';

class PokemonDetailCard extends StatelessWidget {
  const PokemonDetailCard(
      {Key? key,
      required this.pokemonDetail,
      required this.pokemon,
      this.isCompare = false})
      : super(key: key);

  final PokemonDetail pokemonDetail;
  final Pokemon pokemon;
  final bool isCompare;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: isCompare ? 0 : 20,
        vertical: isCompare ? 10 : 20,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Color.fromARGB(255, 167, 247, 156),
                  Color(0xffcbfac5)
                ]),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 15),
            PokemonImage(name: pokemonDetail.name ?? ''),
            const SizedBox(height: 10),
            NameAndId(
              name: pokemonDetail.name ?? '',
              id: pokemonDetail.id ?? 0,
            ),
            const SizedBox(height: 5),
            Experience(
              experience: pokemonDetail.baseExperience ?? 0,
            ),
            const SizedBox(height: 15),
            TypeAndAbility(
              types: pokemonDetail.types,
              abilities: pokemonDetail.abilities,
            ),
            const SizedBox(height: 15),
            const Divider(
              height: 1,
            ),
            const SizedBox(height: 17),
            HeightAndWeight(
              height: pokemonDetail.height,
              weight: pokemonDetail.weight,
            ),
            const SizedBox(height: 17),
            Stats(stats: pokemonDetail.stats),
            const SizedBox(height: 25)
          ],
        ),
      ),
    );
  }
}
