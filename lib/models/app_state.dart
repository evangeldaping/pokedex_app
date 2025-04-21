import '../models/pokemon.dart';

class AppState {
  final List<Pokemon> pokemons;
  final bool isLoading;

  AppState({
    required this.pokemons,
    required this.isLoading,
  });

  AppState.initialState()
      : pokemons = [],
        isLoading = false;

  AppState copy({List<Pokemon>? pokemons, bool? isLoading}) {
    return AppState(
      pokemons: pokemons ?? this.pokemons,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
