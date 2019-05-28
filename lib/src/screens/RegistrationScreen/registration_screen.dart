import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/actions/actions.dart';
import 'package:flutter_boilerplate/src/models/app_state.dart';
import 'package:flutter_boilerplate/src/models/user_data_state.dart';
import 'package:flutter_boilerplate/src/selectors/selectors.dart';
import 'package:flutter_boilerplate/src/services/firebase_config.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'dart:io';
import '../../utility/validation.dart';
import '../Navigators/BottomTabNavigation/index.dart';
import 'package:image_picker/image_picker.dart';

class RegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Registration(),
    );
  }
}

class Registration extends StatefulWidget {
  @override
  _Registration createState() => _Registration();
}

class _Registration extends State<Registration> {
  final firebaseReference = FirebaseReference().databaseReference;
  File _image;
  String fname = '',
      lname = '',
      email = '',
      password = '',
      cpassword = '',
      error = '';

  final myController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  void _getData(context, viewModel) {
    if (fname == '' ||
        lname == '' ||
        email == '' ||
        password == '' ||
        cpassword == '') {
      setState(() {
        error = 'Please Enter all Details';
      });
    } else if (password != cpassword) {
      setState(() {
        error = "Passwords does not match";
      });
    } else {
      setState(() {
        error = '';
      });
      if (Validation.emailValidation(email)) {
        createRecord(context, viewModel);
      } else {
        setState(() {
          error = 'Invalid Email';
        });
      }
    }
  }

  void createRecord(context, viewModel) {
    var time = new DateTime.now().millisecondsSinceEpoch;
    firebaseReference.child("Users").child('$time').set({
      'name': '$fname $lname',
      'email': email,
      'password': password
    }).then((data) {
      viewModel.loginSuccessfull(email, 'login');
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => BottomTab(),
          ));
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Successfully Registered"),
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
    });
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  inputDecoration(hintText) {
    return InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: hintText,
        border: borderStyle);
  }

  Widget build(BuildContext context) {
    final registrationText = Text('Registration',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.blue,
          fontSize: 40,
        ));

    final errorText =
        Text('$error', style: TextStyle(color: Colors.red, fontSize: 20));
    final imagePicker = SizedBox(
        height: 100.0,
        width: 100.0,
        child: _image == null
            ? new FloatingActionButton(
                onPressed: getImage,
                tooltip: 'Pick Image',
                child: Icon(Icons.add_a_photo),
              )
            : new FloatingActionButton(
                onPressed: getImage,
                tooltip: 'Pick Image',
                child: new CircleAvatar(
                  backgroundImage: new FileImage(_image),
                  radius: 200.0,
                ),
              ));

    final firstName = TextField(
        controller: firstNameController,
        obscureText: false,
        style: style,
        onChanged: (text) {
          setState(() {
            fname = text;
          });
        },
        decoration: inputDecoration("First Name"));

    final lastName = TextField(
        controller: lastNameController,
        obscureText: false,
        style: style,
        onChanged: (text) {
          setState(() {
            lname = text;
          });
        },
        decoration: inputDecoration("Last Name"));

    final emailField = TextField(
        controller: myController,
        obscureText: false,
        style: style,
        onChanged: (text) {
          setState(() {
            email = text;
          });
        },
        decoration: inputDecoration("Email"));

    final passwordField = TextField(
        obscureText: true,
        style: style,
        onChanged: (text) {
          setState(() {
            password = text;
          });
        },
        decoration: inputDecoration("Password"));

    final confirmPassword = TextField(
        obscureText: true,
        style: style,
        onChanged: (text) {
          setState(() {
            cpassword = text;
          });
        },
        decoration: inputDecoration("Confirm Password"));

    final loginText = InkWell(
        child: Text(
          "Already an Account ? Login ?",
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => BottomTab(),
              ));
        });

    registartionButton(viewModel) {
      return Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30.0),
        color: Color(0xff01A0C7),
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () {
            _getData(context, viewModel);
          },
          child: Text("Register",
              textAlign: TextAlign.center,
              style: style.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      );
    }

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
                        SizedBox(height: 25.0),
                        registrationText,
                        SizedBox(height: 5.0),
                        errorText,
                        imagePicker,
                        SizedBox(height: 20.0),
                        firstName,
                        SizedBox(height: 20.0),
                        lastName,
                        SizedBox(height: 20.0),
                        emailField,
                        SizedBox(height: 20.0),
                        passwordField,
                        SizedBox(height: 20.0),
                        confirmPassword,
                        SizedBox(height: 35.0),
                        registartionButton(viewModel),
                        SizedBox(height: 15.0),
                        loginText,
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
        loginSuccessfull: (email, signInMethod) {
          store.dispatch(
              LoginSuccessfull(email: email, signInMethod: signInMethod));
        },
        userdata: userDataStateSelector(store.state));
  }
}

TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
OutlineInputBorder borderStyle =
    OutlineInputBorder(borderRadius: BorderRadius.circular(32.0));
