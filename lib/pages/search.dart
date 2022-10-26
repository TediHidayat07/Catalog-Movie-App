import 'package:catalog_movie_app/pages/detail_page.dart';
import 'package:flutter/material.dart';

import '../models/movie_response.dart';
import '../services/api_services.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextField(
            controller: searchCtrl,
            autocorrect: true,
            autofocus: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: const EdgeInsets.all(20),
              labelText: 'Search film',
              prefixIcon: const Icon(Icons.search),
            ),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            onSubmitted: (String text) {
              setState(() {});
            },
          ),
          const SizedBox(
            height: 10,
          ),
          searchCtrl.text.isNotEmpty
              ? Expanded(
                  child: FutureBuilder<MovieResponse>(
                    future: ApiServices().searchMovies(searchCtrl.text),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        MovieResponse data = snapshot.data;
                        return ListView.builder(
                          itemCount: data.movieList.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return DetailPage(
                                      movie: data.movieList[index]);
                                }));
                              },
                              child: Card(
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
                                                  .bodySmall!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold),
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
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return const Text('Error when get data');
                      }
                    },
                  ),
                )
              : const Text('Search catalog film?')
        ],
      ),
    ));
  }
}
