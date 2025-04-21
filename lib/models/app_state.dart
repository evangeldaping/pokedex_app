import 'package:async_redux/async_redux.dart';
import 'pokemon.dart';

class AppState {
  final List<Pokemon> pokemons;
  final Wait wait;

  AppState({
    required this.pokemons,
    required this.wait,
  });

  AppState.initialState()
      : pokemons = [],
        wait = Wait();

  AppState copy({List<Pokemon>? pokemons, Wait? wait}) {
    return AppState(
      pokemons: pokemons ?? this.pokemons,
      wait: wait ?? this.wait,
    );
  }

  @override
  String toString() => 'AppState(pokemons: ${pokemons.length}, wait: $wait)';
}
