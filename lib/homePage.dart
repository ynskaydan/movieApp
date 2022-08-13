import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement
    // build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "MyMovieApp",
          style: TextStyle(fontSize: 24, color: Colors.blue),
        ),
      ),
      body: Center(),
    );
  }
}
