import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokemon_flutter_app/api/pokemon_api.dart';
import 'package:pokemon_flutter_app/src/pokemon_list/models/pokemon.dart';

part 'pokemon_state.dart';
part 'pokemon_cubit.freezed.dart';

class PokemonCubit extends Cubit<PokemonState> {
  PokemonCubit() : super(const PokemonState.initial()) {
    emit(const PokemonState.loading());
    controller = ScrollController()..addListener(_scrollListener);
    _getPokemonList();
  }
  ScrollController? controller;
  List<Pokemon> pokemonList = [];
  List<Pokemon> filteredPokemonList = [];
  List<Pokemon> selectedPokemon = [];
  bool loading = false;

  @override
  Future<void> close() {
    controller!.removeListener(_scrollListener);
    return super.close();
  }

  void _getPokemonList() async {
    try {
      pokemonList.addAll(await PokemonApi().getPokemonList());
      filteredPokemonList = pokemonList;
      emit(PokemonState.loaded(
          filteredPokemonList: filteredPokemonList, pokemonList: pokemonList));
    } catch (e) {
      emit(PokemonState.error(e.toString()));
    }
  }

  void filterPokemon(String query) {
    filteredPokemonList =
        pokemonList.where((pokemon) => pokemon.name.contains(query)).toList();
    emit(PokemonState.loaded(
        filteredPokemonList: filteredPokemonList, pokemonList: pokemonList));
  }

  void getNewPokemon() async {
    loading = true;
    List<Pokemon> newPokemons =
        await PokemonApi().getPokemonList(pokemonList.length);
    pokemonList = [...pokemonList, ...newPokemons];
    filteredPokemonList = pokemonList;
    emit(PokemonState.loaded(
        filteredPokemonList: filteredPokemonList, pokemonList: pokemonList));
    loading = false;
  }

  void _scrollListener() async {
    if (controller!.position.extentAfter == 0) {
      if (!loading && (filteredPokemonList.length == pokemonList.length)) {
        getNewPokemon();
      }
    }
  }
}
