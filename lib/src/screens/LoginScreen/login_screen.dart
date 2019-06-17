import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/actions/user_action.dart';
import 'package:flutter_boilerplate/src/models/app_state.dart';
import 'package:flutter_boilerplate/src/models/user_data_state.dart';
import 'package:flutter_boilerplate/src/screens/InAppPurchase/index.dart';
import 'package:flutter_boilerplate/src/selectors/selectors.dart';
import 'package:flutter_boilerplate/src/services/firebase_config.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../Navigators/BottomTabNavigation/index.dart';
import '../../utility/validation.dart';
import '../../widgets/google_signIn_button.dart';
import '../../widgets/facebook_signIn_button.dart';
import '../RegistrationScreen/registration_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginView(),
    );
  }
}

class LoginView extends StatefulWidget {
  @override
  _LoginView createState() => _LoginView();
}

class _LoginView extends State<LoginView> {
  String email = '', password = '', error = '';
  final myController = TextEditingController();
  final firebaseReference = FirebaseReference().databaseReference;

  checkData(viewModel) async{
    int flag = 0;
    var db = firebaseReference.child("Users");
    await db.once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((key, values) {
        print("valuesssssss $values, $key");
        if (values["email"] == email && values["password"] == password) {
          flag = 1;
          viewModel.loginSuccessfull(values["email"]) ;
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => BottomTab(),
              ));
        }
      });
    });
    if (flag == 0) {
      setState(() {
        error = 'Email or password is incorrect';
      });
    }
  }
  


  void _getData(context,viewModel) {
    if (email == '' || password == '') {
      setState(() {
        error = 'Please Enter all Details';
      });
    } else {
      setState(() {
        error = '';
      });
      if (Validation.emailValidation(email)) {
        checkData(viewModel);
      } else {
        setState(() {
          error = 'Invalid Email';
        });
      }
    }
  }

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  Widget build(BuildContext context) {
    final loginText = Text('Welcome to Flutter. Please login to continue.',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.blue,
          fontSize: 30,
        ));
    final errorText =
        Text('$error', style: TextStyle(color: Colors.red, fontSize: 20));

    final emailField = TextField(
      controller: myController,
      obscureText: false,
      style: style,
      onChanged: (text) {
        setState(() {
          email = text;
        });
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border: borderStyle),
    );

    final passwordField = TextField(
      obscureText: true,
      style: style,
      onChanged: (text) {
        password = text;
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border: borderStyle),
    );

    loginButton(viewModel){
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          _getData(context,viewModel);
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
}
    final registrationText = InkWell(
        child: Text(
          "Do not have an Account ? SignUp ?",
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => RegistrationScreen(),
              ));
        });

    return new StoreConnector<AppState, _ViewModel>(
        converter: (store) => _ViewModel.fromStore(store),
        builder: (BuildContext context, _ViewModel viewModel) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Center(
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(36.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 55.0,
                          child: Image.asset(
                            "assets/flutter.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(height: 25.0),
                        loginText,
                        SizedBox(height: 5.0),
                        errorText,
                        SizedBox(height: 45.0),
                        emailField,
                        SizedBox(height: 25.0),
                        passwordField,
                        SizedBox(height: 35.0,),
                        loginButton(viewModel),
                        SizedBox(height: 35.0, ),
                        GoogleSigninButton(),
                        SizedBox(height: 35.0,),
                        FacebookSigninButton(),
                        SizedBox(height: 15.0,),
                        registrationText
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
class _ViewModel {
  final Function loginSuccessfull;
  final UserDataState userdata;

  _ViewModel({
    this.loginSuccessfull,
    @required this.userdata,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        loginSuccessfull:(email) {
          print("Email in screen is $email");
          store.dispatch(LoginSuccessfull(email:email));
        },
        userdata: userDataStateSelector(store.state));
  }
}

TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
OutlineInputBorder borderStyle =
    OutlineInputBorder(borderRadius: BorderRadius.circular(32.0));
