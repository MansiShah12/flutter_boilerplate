import 'package:flutter/material.dart';
import '../Navigators/BottomTabNavigation/index.dart';
import '../../utility/ validation.dart';
import '../../widgets/google_signIn_button.dart';
import '../../widgets/facebook_signIn_button.dart';
import '../Registration/registration_screen.dart';
import '../user_screen.dart';

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
  void _getData(context) {
    if (email == '' || password == '') {
      setState(() {
        error = 'Please Enter all Details';
      });
    } else {
      setState(() {
        error = '';
      });
      if (Validation.emailValidation(email)) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => BottomTab(),
            ));
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text("Successfully LoggedIn"),
              content: new Text("$email"),
              actions: <Widget>[
                new FlatButton(
                  child: new Text("Ok"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
      } else {
        setState(() {
          error = 'Invalid Email';
        });
      }
    }
  }

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  Widget build(BuildContext context) {
    final loginText =
        Text('Welcome to Flutter. Please login to continue.', 
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.blue, fontSize: 30,));
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

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          _getData(context);
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    
    final registrationText = InkWell(
        child: Text(
          "Do not have an Account ? SignUp ?",
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => OwnerDetails(),
              ));
        });

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
                  SizedBox(
                    height: 35.0,
                  ),
                  loginButon,
                  SizedBox(
                    height: 35.0,
                  ),
                  GoogleSigninButton(),
                  SizedBox(
                    height: 35.0,
                  ),
                  FacebookSigninButton(),
                  SizedBox(
                    height: 15.0,
                  ),
                  registrationText
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
OutlineInputBorder borderStyle =
    OutlineInputBorder(borderRadius: BorderRadius.circular(32.0));
