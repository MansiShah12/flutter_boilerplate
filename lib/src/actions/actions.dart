import '../models/github_repo_result.dart';
import '../models/owner_details_result.dart';
import 'package:meta/meta.dart';

class Login {
  final String login;
 
Login({
    @required this.login,
  });
}

class LoginSuccessfull {
  final String email;

  LoginSuccessfull({
    @required this.email,
  });
}

