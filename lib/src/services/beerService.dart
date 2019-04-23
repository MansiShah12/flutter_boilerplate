
import '../models/beer.dart';
import './index.dart';

Future<Stream<Beer>> getBeers()  {
 return  fetchData('get','v2/beers');
}