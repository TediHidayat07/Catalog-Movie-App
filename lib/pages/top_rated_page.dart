import 'package:catalog_movie_app/services/api_services.dart';
import 'package:flutter/material.dart';

import '../models/movie_response.dart';

class TopRatedPage extends StatelessWidget {
  const TopRatedPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TOP RATED MOVIE'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder<MovieResponse>(
                future: ApiServices().getTopRatedMovies(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    MovieResponse data = snapshot.data;
                    return ListView.builder(
                      itemCount: data.movieList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                '$baseImageURL${data.movieList[index].posterPath}',
                                height: 150,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        data.movieList[index].title,
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                                fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        data.movieList[index].overview,
                                        maxLines: 4,
                                        overflow: TextOverflow.ellipsis,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return const Text('Error when get data');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
