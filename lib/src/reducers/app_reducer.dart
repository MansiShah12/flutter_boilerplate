import '../models/app_state.dart';
import '../reducers/owner_details_reducer.dart';


AppState appReducer(AppState state, dynamic action) {
  return AppState(
   
    userdatastate: ownerDetailsReducer(state.userdatastate, action),
  );
}