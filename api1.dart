import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GIF',
      theme: ThemeData(
        brightness: Brightness.dark,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
          headline6: TextStyle(color: Colors.white),
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.white),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> gifs = [];
  TextEditingController searchController = TextEditingController();

  Future<void> fetchGifs(String query) async {
    final response = await http.get(
      Uri.parse(
          'https://api.giphy.com/v1/gifs/search?api_key=n1w8F6G2RZXDmLTJ8QKTZyea2HZ9Ch4o&q=$query&limit=10&offset=0&rating=g&bundle=messaging_non_clips'),
    );

    if (response.statusCode == 200) {
      setState(() {
        gifs = jsonDecode(response.body)['data'];
      });
    } else {
      print('Error en la solicitud');
    }
  }

  void searchGifs() {
    final String query = searchController.text;
    fetchGifs(query);
  }

  @override
  void initState() {
    super.initState();
    fetchGifs('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Buscar GIFS',
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: searchGifs,
            ),
          ],
        ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: gifs.length,
        itemBuilder: (context, index) {
          return CachedNetworkImage(
            imageUrl: gifs[index]['images']['original']['url'],
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          );
        },
      ),
    );
  }
}
