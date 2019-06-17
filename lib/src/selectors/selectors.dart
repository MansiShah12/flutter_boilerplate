import '../models/beer_data_state.dart';
import '../models/app_state.dart';
import '../models/user_data_state.dart';

UserDataState userDataStateSelector(AppState state) => state.userdatastate;
BeerDataState beerDataStateSelector(AppState state) => state.beerDataState;