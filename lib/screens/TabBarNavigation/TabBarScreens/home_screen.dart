import 'package:flutter/material.dart';
import '../../../repository/beer_repository.dart';
import '../../../models/beer.dart';
import '../../../widgets/beerTile.dart';

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
    listenForBeers();
  }

  void listenForBeers() async {
    final Stream<Beer> stream = await getBeers();
    print("streamstreamstream: $stream");
    stream.listen((Beer beer) => setState(() => _beers.add(beer)));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
          body: Center(
        child: Column(
         children: <Widget>[
            new SizedBox(
            child : new Container(
               width: MediaQuery.of(context).size.width,
              decoration: new BoxDecoration(color: Colors.brown),
          child:Center(
          child: Padding(
             padding: const EdgeInsets.all(8.0),
         child : new Text(
              'BEERS',
              style: TextStyle(fontSize: 20,),
            ),
          )
          )
            ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: SizedBox(
                height: 200.0,
                child: new ListView.builder(
                  itemCount: _beers.length,
                  itemBuilder: (context, index) => BeerTile(_beers[index]),
                ),
              ),
            ),
          ],
        ),
      ));


}
