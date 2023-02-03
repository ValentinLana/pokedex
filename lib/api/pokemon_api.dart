import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:pokemon_flutter_app/src/pokemon_detail/models/pokemon_detail.dart';

import '../src/pokemon_list/models/pokemon.dart';

class PokemonApi {
  Future<List<Pokemon>> getPokemonList([int? existingPokemons]) async {
    final offset = existingPokemons != null ? 'offset=$existingPokemons&' : '';
    try {
      final response = await http.get(
          Uri.parse('https://pokeapi.co/api/v2/pokemon?${offset}limit=151'));
      if (response.statusCode >= 400) {
        throw Exception('Failed to load pokemon list');
      }
      final data = json.decode(response.body)['results'];
      final List<Pokemon> pokemonList =
          data.map<Pokemon>((item) => Pokemon.fromJson(item)).toList();
      return pokemonList;
    } on SocketException {
      throw Exception('Network Failure');
    }
  }

  Future<PokemonDetail> getPokemonDetail(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode >= 400) {
        throw Exception('Failed to load pokemon detail');
      }
      final data = json.decode(response.body);
      final PokemonDetail pokemonDetail = PokemonDetail.fromJson(data);
      return pokemonDetail;
    } on SocketException {
      throw Exception('Network Failure');
    }
  }
}
