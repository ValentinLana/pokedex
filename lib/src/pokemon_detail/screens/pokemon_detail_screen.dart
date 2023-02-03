import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_flutter_app/src/common/screens/error_screen.dart';
import 'package:pokemon_flutter_app/src/common/widgets/pokemon_detail_card.dart';
import 'package:pokemon_flutter_app/src/pokemon_detail/widgets/compare_button.dart';
import 'package:pokemon_flutter_app/src/pokemon_list/models/pokemon.dart';
import 'package:pokemon_flutter_app/src/pokemon_detail/cubit/pokemon_detail_cubit.dart';
import 'package:pokemon_flutter_app/src/pokemon_detail/models/pokemon_detail.dart';

class PokemonDetailScreen extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetailScreen(this.pokemon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pokemon.name,
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: const Color.fromARGB(255, 167, 247, 156),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: BlocProvider(
        create: (context) => PokemonDetailCubit(pokemon),
        child: const DetailBody(),
      ),
    );
  }
}

class DetailBody extends StatelessWidget {
  const DetailBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonDetailCubit, PokemonDetailState>(
      builder: (context, state) => state.when(
        initial: () => const Center(child: CircularProgressIndicator()),
        loading: () => const Center(child: CircularProgressIndicator()),
        loaded: (pokemonDetail, pokemon) => GeneralInfo(
          pokemonDetail: pokemonDetail,
          pokemon: pokemon,
        ),
        error: (e) => const ErrorScreen(),
      ),
    );
  }
}

class GeneralInfo extends StatelessWidget {
  const GeneralInfo(
      {Key? key, required this.pokemonDetail, required this.pokemon})
      : super(key: key);

  final PokemonDetail pokemonDetail;
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PokemonDetailCard(
            pokemon: pokemon,
            pokemonDetail: pokemonDetail,
          ),
          CompareButton(
            pokemon: pokemon,
            pokemonDetail: pokemonDetail,
          )
        ],
      ),
    );
  }
}
