import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_flutter_app/src/pokemon_compare/screens/pokemon_compare_screen.dart';
import 'package:pokemon_flutter_app/src/pokemon_detail/models/pokemon_detail.dart';
import 'package:pokemon_flutter_app/src/pokemon_list/cubit/pokemon_cubit.dart';
import 'package:pokemon_flutter_app/src/pokemon_list/models/pokemon.dart';

import 'multi_select.dart';

class CompareButton extends StatelessWidget {
  const CompareButton(
      {Key? key, required this.pokemonDetail, required this.pokemon})
      : super(key: key);

  final PokemonDetail pokemonDetail;
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(32, 0, 32, 25),
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
        onPressed: () => selectPokemonsAndNavigate(context),
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
          backgroundColor: MaterialStateProperty.all<Color>(
              const Color.fromARGB(255, 167, 247, 156)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        child: const Text(
          'Compare',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Color.fromARGB(221, 39, 38, 38),
          ),
        ),
      ),
    );
  }

  selectPokemonsAndNavigate(BuildContext context) async {
    final navigator = Navigator.of(context);
    final List<Pokemon>? selectedPokemonList = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(
            items: BlocProvider.of<PokemonCubit>(context).pokemonList);
      },
    );
    if (selectedPokemonList != null) {
      navigator.push(
        MaterialPageRoute(
          builder: (context) => PokemonCompareScreen(
            selectedPokemonList: selectedPokemonList,
            pokemonDetail: pokemonDetail,
            pokemon: pokemon,
          ),
        ),
      );
    }
  }
}
