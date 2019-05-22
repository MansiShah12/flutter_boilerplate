import 'package:flutter_boilerplate/src/models/beer_data_state.dart';
import '../models/user_data_state.dart';
import '../models/repo_state.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  final RepoState repoState;
  final UserDataState userdatastate;
  final BeerDataState beerDataState;

  AppState({
    @required this.repoState,
    @required this.userdatastate,
    @required this.beerDataState,
  });

  factory AppState.initial() {
    return AppState(
      repoState: RepoState.initial(),
      userdatastate: UserDataState.initial(),
      beerDataState: BeerDataState.initial(),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          repoState == other.repoState &&
          userdatastate == other.userdatastate &&
          beerDataState == other.beerDataState;
}
