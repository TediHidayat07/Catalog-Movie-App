import 'package:catalog_movie_app/models/movie_response.dart';
import 'package:catalog_movie_app/pages/detail_page.dart';
import 'package:catalog_movie_app/pages/now_playing_page.dart';
import 'package:catalog_movie_app/pages/popular_page.dart';
import 'package:catalog_movie_app/pages/top_rated_page.dart';
import 'package:catalog_movie_app/services/api_services.dart';
import 'package:flutter/material.dart';
import '../widgets/movie_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Now Playing Movies',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const NowPlayingPage()));
                      },
                      child: Text(
                        'See all',
                        style: Theme.of(context).textTheme.titleSmall,
                      ))
                ],
              ),
              FutureBuilder<MovieResponse>(
                future: ApiServices().getNowPlayingMovies(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    MovieResponse data = snapshot.data;
                    return SizedBox(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return MovieCard(
                            movie: data.movieList[index],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailPage(
                                          movie: data.movieList[index])));
                            },
                          );
                        },
                      ),
                    );
                  } else {
                    return const Text('Error when get data');
                  }
                },
              ),
              const SizedBox(height: 36.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Top Rated',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  TextButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TopRatedPage(),
                          )),
                      child: Text(
                        'See all',
                        style: Theme.of(context).textTheme.titleSmall,
                      ))
                ],
              ),
              FutureBuilder<MovieResponse>(
                future: ApiServices().getTopRatedMovies(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    MovieResponse data = snapshot.data;
                    return SizedBox(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return MovieCard(
                            movie: data.movieList[index],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailPage(
                                            movie: data.movieList[index],
                                          )));
                            },
                          );
                        },
                      ),
                    );
                  } else {
                    return const Text('Error when get data');
                  }
                },
              ),
              const SizedBox(height: 36.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Movies',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PopularPage()));
                      },
                      child: Text(
                        'See all',
                        style: Theme.of(context).textTheme.titleSmall,
                      ))
                ],
              ),
              FutureBuilder(
                future: ApiServices().getPopularMovies(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    MovieResponse data = snapshot.data;
                    return SizedBox(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return MovieCard(
                            movie: data.movieList[index],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailPage(
                                          movie: data.movieList[index])));
                            },
                          );
                        },
                      ),
                    );
                  } else {
                    return const Text('Error when get data');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
