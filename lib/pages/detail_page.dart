import 'package:flutter/material.dart';
import 'package:catalog_movie_app/services/api_services.dart';
import '../models/movie.dart';
import '../models/movie_response.dart';
import '../widgets/movie_card.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.movie}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network('$baseImageURL${movie.posterPath}'),
          DraggableScrollableSheet(
              expand: true,
              maxChildSize: 0.65,
              minChildSize: 0.45,
              builder: (context, scrollController) {
                return Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                movie.title,
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              const Divider(),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(movie.overview),
                              const SizedBox(
                                height: 10,
                              ),
                              Text('Adult : ${movie.adult}'),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Recommendation Movie',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              FutureBuilder<MovieResponse>(
                                future: ApiServices()
                                    .getRecommendationMovies(movie.id),
                                builder: (context, AsyncSnapshot snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    MovieResponse data = snapshot.data;
                                    return SizedBox(
                                      height: 200,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: data.movieList.length,
                                        itemBuilder: (context, index) {
                                          return MovieCard(
                                            movie: data.movieList[index],
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          DetailPage(
                                                              movie:
                                                                  data.movieList[
                                                                      index])));
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
                              const SizedBox(
                                height: 20,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
          SafeArea(
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.navigate_before))),
        ],
      ),
    );
  }
}
