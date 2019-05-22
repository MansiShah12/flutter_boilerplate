import 'package:flutter_boilerplate/src/actions/fetch_beer_action.dart';
import 'package:flutter_boilerplate/src/models/beer_data_state.dart';
import 'package:redux/redux.dart';

Reducer<BeerDataState> beerDetailReducer = combineReducers([
  TypedReducer<BeerDataState, FetchBeerSuccessfull>(_storeBeers),
  ]);

BeerDataState _storeBeers(BeerDataState state, FetchBeerSuccessfull action) {
  return state.copyWith(
    beers: action.beers,
   );
}

