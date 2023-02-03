part of 'pokemon_compare_cubit.dart';

@freezed
class PokemonCompareState with _$PokemonCompareState {
  const factory PokemonCompareState.initial() = _Initial;
  const factory PokemonCompareState.loading() = _Loading;

  const factory PokemonCompareState.loaded({
    required List<PokemonDetail> pokemonDetailList,
    required List<Pokemon> pokemonList,
  }) = _Loaded;

  const factory PokemonCompareState.error(String? detail) = _Error;
}
