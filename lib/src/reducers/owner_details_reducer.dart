import '../actions/actions.dart';
import '../models/user_data_result.dart';
import '../models/user_data_state.dart';
import 'package:redux/redux.dart';

Reducer<UserDataState> ownerDetailsReducer = combineReducers([
  TypedReducer<UserDataState, LoginSuccessfull>(_loadOwnerDetails),
  TypedReducer<UserDataState, UserLoading>(_userLoading),
  TypedReducer<UserDataState, LogOutUser>(_logOutUser),
]);

UserDataState _loadOwnerDetails(UserDataState state, LoginSuccessfull action) {
  print("action.emailaction.emailaction.email, ${action.email}");
  return state.copyWith(
    isLoading: false,
    data: action.email,
    error: null,
  );
}

UserDataState _userLoading(UserDataState state, UserLoading action) {
  return state.copyWith(
    isLoading: action.isLoading,
   );
}

UserDataState _logOutUser(UserDataState state, LogOutUser action) {
  return state.copyWith(
    data:'',
    loggedIn:action.loggedIn
   );
}
