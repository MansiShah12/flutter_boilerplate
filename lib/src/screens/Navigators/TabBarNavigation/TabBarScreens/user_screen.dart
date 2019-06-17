import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/models/app_state.dart';
import 'package:flutter_boilerplate/src/models/user_data_state.dart';
import 'package:flutter_boilerplate/src/selectors/selectors.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class UserDetails extends StatelessWidget {
  UserDetails({Key key}) : super(key: key);
  mainView(context, viewModel) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: _createColumn(context, viewModel),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            appBar: AppBar(
                title: Text("My Profile"),
                automaticallyImplyLeading: true,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context, false),
                )),
            body: mainView(context, viewModel),
          ),
        );
      },
    );
  }

  Column _createColumn(BuildContext context, _ViewModel viewModel) {
    String data = viewModel.userdata.data;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(50.0, 50.0, 50.0, 50.0),
          child: Text("Hello, $data",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )),
        )
      ],
    );
  }
}

class _ViewModel {
  final UserDataState userdata;

  _ViewModel({
    @required this.userdata,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      userdata: userDataStateSelector(store.state),
    );
  }
}
