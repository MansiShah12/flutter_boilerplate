import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../models/app_state.dart';
import '../models/owner_details_result.dart';
import '../models/owner_details_state.dart';
import '../selectors/selectors.dart';
import 'package:redux/redux.dart';

class OwnerDetails extends StatelessWidget {
  OwnerDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: _createColumn(context, viewModel),
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
        Text( data),
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
