import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/actions/fetch_beer_action.dart';
import 'package:flutter_boilerplate/src/models/app_state.dart';
import 'package:flutter_boilerplate/src/models/beer_data_state.dart';
import 'package:flutter_boilerplate/src/models/user_data_state.dart';
import 'package:flutter_boilerplate/src/selectors/selectors.dart';
import 'package:flutter_boilerplate/src/widgets/activity_indicator.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../../../../models/beer.dart';
import '../../../../widgets/beerTile.dart';

class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(title: ' Home Page '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Beer> _beers = <Beer>[];
  void initState() {
    super.initState();
  }

  listView(_beers) {
    if (_beers == null) {
      return Loading();
    } else {
      return new ListView.builder(
          itemCount: _beers.length,
          itemBuilder: (context, index) => BeerTile(_beers[index]));
    }
  }

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, _ViewModel>(
      onInit: (store) => store.dispatch(new FetchBeer()),
      converter: (store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        List<Beer> _beers = viewModel.beerdata.beers;
        return Scaffold(
            body: Center(
          child: Column(
            children: <Widget>[
              new SizedBox(
                child: new Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: new BoxDecoration(color: Colors.brown),
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new Text(
                        'BEERS',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ))),
              ),
              SizedBox(height: 20),
              Expanded(
                child: SizedBox(height: 200.0, child: listView(_beers)),
              ),
            ],
          ),
        ));
      });
}

class _ViewModel {
  final Function fetchBeer;
  final UserDataState userdata;
  final BeerDataState beerdata;

  _ViewModel({
    this.fetchBeer,
    this.userdata,
    this.beerdata,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        fetchBeer: () {
          store.dispatch(FetchBeer());
        },
        userdata: userDataStateSelector(store.state),
        beerdata: beerDataStateSelector(store.state));
  }
}
