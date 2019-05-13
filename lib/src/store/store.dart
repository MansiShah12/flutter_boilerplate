import '../middleware/app_middleware.dart';
import '../models/app_state.dart';
import '../reducers/app_reducer.dart';
import 'package:redux/redux.dart';

Store<AppState> createStore() {
  return Store(
    appReducer,
    initialState: AppState.initial(),
    middleware: AppMiddleware().createMiddleware(), 
  );
}
