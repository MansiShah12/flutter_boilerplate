import '../actions/actions.dart';
import '../models/user_data_result.dart';
import '../models/user_data_state.dart';
import 'package:redux/redux.dart';

Reducer<UserDataState> ownerDetailsReducer = combineReducers([
  TypedReducer<UserDataState, LoginSuccessfull>(_loadOwnerDetails),
  TypedReducer<UserDataState, LogOutSuccessfull>(_logOutUser),
  TypedReducer<UserDataState, UserLoading>(_userLoading),
]);

UserDataState _loadOwnerDetails(UserDataState state, LoginSuccessfull action) {
  return state.copyWith(
    isLoading: false,
    data: action.email,
    signInMethod: action.signInMethod,
    loggedIn:true
    );
}
UserDataState _logOutUser(UserDataState state, LogOutSuccessfull action) {
  return state.copyWith(
    data: action.email,
    signInMethod: action.signInMethod,
    loggedIn:false
    );
}


UserDataState _userLoading(UserDataState state, UserLoading action) {
  return state.copyWith(
    isLoading: action.isLoading,
   );
}


