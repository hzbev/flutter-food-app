import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'helpers.dart';

class LikesScreen extends StatefulWidget {
  /// Constructs a [DetailsScreen]
  const LikesScreen({Key? key}) : super(key: key);

  @override
  State<LikesScreen> createState() => _LikesScreenState();
}

class _LikesScreenState extends State<LikesScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> _counter;
  late Future<List> recipeData;

  Future<void> _incrementCounter() async {
    final SharedPreferences prefs = await _prefs;
    final int counter = (prefs.getInt('counter') ?? 0) + 1;

    setState(() {
      _counter = prefs.setInt('counter', counter).then((bool success) {
        return counter;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    recipeData = fetchAlbum();
    _counter = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('counter') ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Details Screen')),
      body: Center(
          child: FutureBuilder<List<dynamic>>(
        future: recipeData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data?[0]['name']);
            print(snapshot.data?[1]["price"]?.toString()??'0.0');
            // return Text(snapshot.data?[0]['name']);
            return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 100,
                    // color: Colors.amber[colorCodes[index]],
                    child: Center(
                        child: Column(
                      children: <Widget>[
                        Text(snapshot.data?[index]["name"]),
                        Text('${snapshot.data?[index]["price"]?.toString()??"0.0"}\$'),

                      ],
                    )),
                  );
                });
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      )),
      // floatingActionButton: FloatingActionButton(
      //     onPressed: _incrementCounter,
      //     tooltip: 'Increment',
      //     child: const Icon(Icons.add)),
    );
  }
}
