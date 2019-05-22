import 'package:flutter_boilerplate/src/models/beer_data_state.dart';
import '../models/app_state.dart';
import '../models/user_data_state.dart';
import '../models/repo_state.dart';

RepoState repoStateSelector(AppState state) => state.repoState;

int totalResultsSelector(AppState state) => state.repoState.data.totalCount;

UserDataState userDataStateSelector(AppState state) => state.userdatastate;
BeerDataState beerDataStateSelector(AppState state) => state.beerDataState;