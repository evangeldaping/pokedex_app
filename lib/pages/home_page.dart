import 'package:flutter/material.dart';
import 'package:async_redux/async_redux.dart';
import '../models/app_state.dart';
import '../models/pokemon.dart';
import '../store/actions/fetch_pokemons_action.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      vm: () => _Factory(),
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

class _Factory extends VmFactory<AppState, HomePage, _ViewModel> {
  @override
  _ViewModel fromStore() => _ViewModel(
    pokemons: state.pokemons,
    isLoading: state.wait.isWaiting("loading"),
  );
}


class _ViewModel extends Vm {
  final List<Pokemon> pokemons;
  final bool isLoading;

  _ViewModel({
    required this.pokemons,
    required this.isLoading,
  });
}
