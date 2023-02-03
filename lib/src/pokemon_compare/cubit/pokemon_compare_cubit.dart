import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_flutter_app/api/pokemon_api.dart';
import 'package:pokemon_flutter_app/src/pokemon_list/models/pokemon.dart';
import 'package:pokemon_flutter_app/src/pokemon_detail/models/pokemon_detail.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_compare_state.dart';
part 'pokemon_compare_cubit.freezed.dart';

class PokemonCompareCubit extends Cubit<PokemonCompareState> {
  PokemonCompareCubit(
      this.selectedPokemonList, this.pokemonDetail, this.pokemon)
      : super(const PokemonCompareState.initial()) {
    emit(const PokemonCompareState.loading());
    _getPokemonsDetail();
    pokemonDetailList.add(pokemonDetail);
    pokemonList.add(pokemon);
  }
  List<Pokemon>? selectedPokemonList;
  PokemonDetail pokemonDetail;
  Pokemon pokemon;
  List<PokemonDetail> pokemonDetailList = [];
  List<Pokemon> pokemonList = [];

  void _getPokemonsDetail() async {
    final newPokemons =
        selectedPokemonList?.where((p) => p.name != pokemon.name).toList();
    try {
      if (newPokemons!.isNotEmpty) {
        for (Pokemon p in newPokemons) {
          pokemonDetail = await PokemonApi().getPokemonDetail(p.url);
          pokemonDetailList.add(pokemonDetail);
          pokemonList.add(p);
        }
      }
      emit(PokemonCompareState.loaded(
          pokemonDetailList: pokemonDetailList, pokemonList: pokemonList));
    } catch (e) {
      emit(PokemonCompareState.error(e.toString()));
    }
  }
}
