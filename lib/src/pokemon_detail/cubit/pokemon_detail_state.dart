part of 'pokemon_detail_cubit.dart';

@freezed
class PokemonDetailState with _$PokemonDetailState {
  const factory PokemonDetailState.initial() = _Initial;
  const factory PokemonDetailState.loading() = _Loading;

  const factory PokemonDetailState.loaded({
    required PokemonDetail pokemonDetail,
    required Pokemon pokemon,
  }) = _Loaded;

  const factory PokemonDetailState.error(String? detail) = _Error;
}
