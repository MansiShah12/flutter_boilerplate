import 'package:meta/meta.dart';

class Login {
  final bool isLoading;
  final context;
  final String signInMethod;

  Login({
    @required this.isLoading,
    @required this.context,
    @required this.signInMethod,
  });
}

class LoginSuccessfull {
  final String email;
  final String signInMethod;

  LoginSuccessfull({@required this.email, @required this.signInMethod});
}

class LogOutSuccessfull {
  final String email;
  final String signInMethod;

  LogOutSuccessfull({@required this.email, @required this.signInMethod});
}

class UserLoading {
  final bool isLoading;

  UserLoading({
    @required this.isLoading,
  });
}

class LogOutUser {
  final String email;
  final String signInMethod;
  final bool loggedIn;

  LogOutUser(
      {@required this.email,
      @required this.loggedIn,
      @required this.signInMethod});
}
