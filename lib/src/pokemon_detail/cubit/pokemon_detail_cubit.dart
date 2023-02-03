import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_flutter_app/api/pokemon_api.dart';
import 'package:pokemon_flutter_app/src/pokemon_list/models/pokemon.dart';
import 'package:pokemon_flutter_app/src/pokemon_detail/models/pokemon_detail.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_detail_state.dart';
part 'pokemon_detail_cubit.freezed.dart';

class PokemonDetailCubit extends Cubit<PokemonDetailState> {
  PokemonDetailCubit(this.pokemon) : super(const PokemonDetailState.initial()) {
    emit(const PokemonDetailState.loading());
    _getPokemonDetail();
  }
  Pokemon? pokemon;
  PokemonDetail? pokemonDetail;

  void _getPokemonDetail() async {
    try {
      pokemonDetail = await PokemonApi().getPokemonDetail(pokemon!.url);
      emit(PokemonDetailState.loaded(
          pokemonDetail: pokemonDetail!, pokemon: pokemon!));
    } catch (e) {
      emit(PokemonDetailState.error(e.toString()));
    }
  }
}
