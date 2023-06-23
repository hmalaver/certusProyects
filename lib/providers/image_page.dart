import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  final String Url;
  const ImagePage({super.key, required this.Url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Image.network(Url),
    );
  }
  
}