import '../models/owner_details_state.dart';
import '../models/repo_state.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  final RepoState repoState;
  final UserDataState userdatastate;

  AppState({
    @required this.repoState,
    @required this.userdatastate,
  });

  factory AppState.initial() {
    return AppState(
      repoState: RepoState.initial(),
      userdatastate: UserDataState.initial(),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          repoState == other.repoState &&
          userdatastate == other.userdatastate;


}
