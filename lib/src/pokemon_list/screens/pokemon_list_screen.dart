import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_flutter_app/src/common/screens/error_screen.dart';
import 'package:pokemon_flutter_app/src/common/widgets/circular_progress_indicator.dart';
import 'package:pokemon_flutter_app/src/pokemon_detail/screens/pokemon_detail_screen.dart';
import 'package:pokemon_flutter_app/src/pokemon_list/cubit/pokemon_cubit.dart';

class PokemonListScreen extends StatelessWidget {
  PokemonListScreen({Key? key}) : super(key: key);

  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex', style: TextStyle(color: Colors.black)),
        backgroundColor: const Color.fromARGB(255, 167, 247, 156),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search Pokemon...',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () => BlocProvider.of<PokemonCubit>(context)
                      .filterPokemon(_searchController.text),
                ),
              ),
            ),
          ),
          const BodyList(),
        ],
      ),
    );
  }
}

class BodyList extends StatelessWidget {
  const BodyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<PokemonCubit, PokemonState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const LoadingProgressIndicator(),
            initial: () => const LoadingProgressIndicator(),
            loading: () => const LoadingProgressIndicator(),
            error: (e) => const ErrorScreen(),
            loaded: (filteredPokemons, pokemonList) => ListView.builder(
              shrinkWrap: true,
              itemCount: filteredPokemons.length,
              controller: BlocProvider.of<PokemonCubit>(context).controller,
              itemBuilder: (context, index) {
                final pokemon = filteredPokemons[index];

                return ListTile(
                  leading: Image.network(
                    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${pokemon.id}.png',
                    width: 50.0,
                    height: 50.0,
                  ),
                  title: Text(pokemon.name),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PokemonDetailScreen(pokemon),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
