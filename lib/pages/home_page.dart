import 'package:flutter/material.dart';
import 'package:async_redux/async_redux.dart';
import '../models/app_state.dart';
import '../models/pokemon.dart';
import '../store/actions/fetch_pokemons_action.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      model: Model(),
      onInit: (store) => store.dispatch(FetchPokemonsAction()),
      builder: (context, vm) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Pokédex'),
          ),
          body: vm.isLoading
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
            itemCount: vm.pokemons.length,
            itemBuilder: (context, index) {
              final pokemon = vm.pokemons[index];
              return ListTile(
                title: Text(pokemon.name),
                leading: CircleAvatar(child: Text("${index + 1}")),
              );
            },
          ),
        );
      },
    );
  }
}

class _ViewModel extends BaseModel<AppState> {
  late List<Pokemon> pokemons;
  late bool isLoading;

  _ViewModel();

  _ViewModel.build({
    required this.pokemons,
    required this.isLoading,
  });

  @override
  _ViewModel fromStore() => _ViewModel.build(
    pokemons: state.pokemons,
    isLoading: state.wait.isWaitingFor("loading"),
  );
}
