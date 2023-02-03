import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_flutter_app/src/common/screens/error_screen.dart';
import 'package:pokemon_flutter_app/src/common/widgets/circular_progress_indicator.dart';
import 'package:pokemon_flutter_app/src/common/widgets/pokemon_detail_card.dart';
import 'package:pokemon_flutter_app/src/pokemon_compare/cubit/pokemon_compare_cubit.dart';
import 'package:pokemon_flutter_app/src/pokemon_detail/models/pokemon_detail.dart';
import 'package:pokemon_flutter_app/src/pokemon_list/models/pokemon.dart';

class PokemonCompareScreen extends StatelessWidget {
  const PokemonCompareScreen({
    Key? key,
    required this.selectedPokemonList,
    required this.pokemonDetail,
    required this.pokemon,
  }) : super(key: key);

  final List<Pokemon>? selectedPokemonList;
  final PokemonDetail pokemonDetail;
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PokemonCompareCubit(selectedPokemonList, pokemonDetail, pokemon),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Compare pokemon',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: const Color.fromARGB(255, 167, 247, 156),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: BlocBuilder<PokemonCompareCubit, PokemonCompareState>(
            builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const LoadingProgressIndicator(),
            error: (e) => const ErrorScreen(),
            loaded: (pokemonDetailList, pokemonList) {
              return PageView.builder(
                itemCount: pokemonDetailList.length,
                controller: PageController(viewportFraction: 0.75),
                itemBuilder: (_, i) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        PokemonDetailCard(
                          pokemon: pokemonList[i],
                          pokemonDetail: pokemonDetailList[i],
                          isCompare: true,
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        }),
      ),
    );
  }
}
