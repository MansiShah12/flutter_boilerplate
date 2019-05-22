import 'package:flutter_boilerplate/src/models/beer.dart';
import 'package:meta/meta.dart';

@immutable
class BeerDataState {
  List<Beer> beers;
  BeerDataState({
    @required this.beers,
  });

  factory BeerDataState.initial() {
    return BeerDataState(
      beers:null,
    );
  }

  BeerDataState copyWith({
    List<Beer> beers,
   }) {
    return BeerDataState(
      beers: beers ?? this.beers,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BeerDataState &&
          runtimeType == other.runtimeType &&
          beers == other.beers;

  @override
  int get hashCode => beers.hashCode;
}
