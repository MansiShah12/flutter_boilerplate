
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/beer.dart';
import '../utility/constants.dart';


Future<Stream<Beer>> fetchData(method,params) async {
final String url = '$BASE_URL$params';
 final client = new http.Client();
 final streamedRest = await client.send(
   http.Request(method, Uri.parse(url))
 );
print("streamedReststreamedRestttttt: $streamedRest");
 return streamedRest.stream
     .transform(utf8.decoder)
     .transform(json.decoder)
     .expand((data) => (data as List))
     .map((data) => Beer.fromJSON(data));
}