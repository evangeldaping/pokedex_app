import 'package:async_redux/async_redux.dart';
import '../models/app_state.dart';

late Store<AppState> store;

void initializeStore() {
  store = Store<AppState>(initialState: AppState.initialState());
}
