import 'package:flutter/material.dart';
import 'package:movie_app/movieModel.dart';

import 'movieProvider.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  List<MovieModel> movies = <MovieModel>[];
  fetchMovies() async {
    var data = await MoviesProvider.getJson();
    setState(() {
      List<dynamic> results = data['results'];
      results.forEach((element) {
        movies.add(MovieModel.fromJson(element));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: movies == null ? 0 : movies.toString().length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(8),
            child: MovieTile(movies, index),
          );
        },
      ),
    );
  }
}

class MovieTile extends StatelessWidget {
  final List<MovieModel> movies;
  final index;

  const MovieTile(this.movies, this.index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: ListTile(
        onTap: () {},
        title: Column(children: [
          movies[index].poster_path != null
              ? Container(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                    image: DecorationImage(
                        image: NetworkImage(MoviesProvider.imagePathPrefix +
                            movies[index].poster_path),
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
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              movies[index].title,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              movies[index].overview,
              style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey),
            ),
          ),
          Divider(
            color: Colors.grey.shade500,
          ),
        ]),
      ),
    );
  }
}
