import '../models/github_repo_result.dart';
import '../models/user_data_result.dart';
import 'package:meta/meta.dart';

class Login {
  final bool isLoading;
  final context;
 
Login({
    @required this.isLoading, 
    @required this.context,
  });
}

class LoginSuccessfull {
  final String email;

  LoginSuccessfull({
    @required this.email,
  });
}
class UserLoading {
  final bool isLoading;

  UserLoading({
    @required this.isLoading,
  });
}
class LogOutUser {
  final String email;
  final bool loggedIn;


  LogOutUser({
    @required this.email,
    @required this.loggedIn,
  });
}

