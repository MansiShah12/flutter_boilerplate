import '../models/user_data_result.dart';
import 'package:meta/meta.dart';

@immutable
class UserDataState {
  final bool isLoading;
  final String data;
  final String error;
  final bool loggedIn;

  UserDataState({
    @required this.isLoading,
    @required this.data,
    @required this.error,
    @required this.loggedIn,
  });

  factory UserDataState.initial() {
    return UserDataState(
      isLoading: false,
      data: '',
      error: null,
      loggedIn:false
    );
  }

  UserDataState copyWith({
    bool isLoading,
    String data,
    String error,
    bool loggedIn,
  })
   {
    return UserDataState(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
      error: error ?? this.error,
      loggedIn: loggedIn?? this.loggedIn,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDataState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          data == other.data &&
          error == other.error &&
          loggedIn == other.loggedIn;

  @override
  int get hashCode => isLoading.hashCode ^ data.hashCode ^ error.hashCode ^ loggedIn.hashCode;
}
