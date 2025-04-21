import 'package:async_redux/async_redux.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../models/app_state.dart';
import '../../models/pokemon.dart';

class FetchPokemonsAction extends ReduxAction<AppState> {
  @override
  Future<AppState?> reduce() async {
    dispatch(WaitAction.add("loading"));

    try {
      final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=100'));

      if (response.statusCode == 200) {
        final List results = json.decode(response.body)['results'];
        final pokemons = results.map((p) => Pokemon.fromJson(p)).toList().cast<Pokemon>();

        return state.copy(pokemons: pokemons);
      } else {
        throw Exception('Failed to load Pokémon');
      }
    } finally {
      dispatch(WaitAction.remove("loading"));
    }
  }
}
