part of 'pokemon_cubit.dart';

@freezed
class PokemonState with _$PokemonState {
  const factory PokemonState.initial() = _Initial;
  const factory PokemonState.loading() = _Loading;

  const factory PokemonState.loaded({
    required List<Pokemon> filteredPokemonList,
    required List<Pokemon> pokemonList,
  }) = _Loaded;

  const factory PokemonState.error(String? detail) = _Error;
}
