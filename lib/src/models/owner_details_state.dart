import '../models/owner_details_result.dart';
import 'package:meta/meta.dart';

@immutable
class UserDataState {
  final bool isLoading;
  final String data;
  final String error;

  UserDataState({
    @required this.isLoading,
    @required this.data,
    @required this.error,
  });

  factory UserDataState.initial() {
    return UserDataState(
      isLoading: false,
      data: null,
      error: null,
    );
  }

  UserDataState copyWith({
    bool isLoading,
    String data,
    String error,
  }) {
    return UserDataState(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
      error: error ?? this.error,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDataState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          data == other.data &&
          error == other.error;

  @override
  int get hashCode => isLoading.hashCode ^ data.hashCode ^ error.hashCode;
}
