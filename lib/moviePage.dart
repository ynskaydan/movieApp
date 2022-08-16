import 'package:flutter/material.dart';
import 'package:movie_app/movieList.dart';
import 'package:movie_app/movieModel.dart';

import 'movieProvider.dart';

class moviePage extends StatefulWidget {
  @override
  State<moviePage> createState() => _moviePageState();
}

class _moviePageState extends State<moviePage> {
  @override
  Widget build(BuildContext context) {
    final movie = ModalRoute.of(context)!.settings.arguments as MovieModel;
    return Scaffold(
      appBar: AppBar(
          title: Text(
            movie.title,
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            Padding(
                padding: EdgeInsets.all(8), child: Icon(Icons.favorite_border))
          ]),
      body: Center(
          child: ListView(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: movie.poster_path != null
                    ? Container(
                        height: MediaQuery.of(context).size.height / 4,
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey,
                          image: DecorationImage(
                              image: NetworkImage(
                                  MoviesProvider.imagePathPrefix +
                                      movie.poster_path),
                              fit: BoxFit.cover),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 3,
                              offset: Offset(1, 3),
                            )
                          ],
                        ))
                    : Container(),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(movie.title),
              )
            ],
          )
        ],
      )),
    );
  }
}
