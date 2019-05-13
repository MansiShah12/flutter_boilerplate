import '../actions/actions.dart';
import '../models/owner_details_result.dart';
import '../models/owner_details_state.dart';
import 'package:redux/redux.dart';

Reducer<UserDataState> ownerDetailsReducer = combineReducers([
  TypedReducer<UserDataState, LoginSuccessfull>(_loadOwnerDetails),
]);

UserDataState _loadOwnerDetails(UserDataState state, LoginSuccessfull action) {
  print("action.emailaction.emailaction.email, ${action.email}");
  return state.copyWith(
    isLoading: false,
    data: action.email,
    error: null,
  );
}

