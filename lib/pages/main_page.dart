import 'package:catalog_movie_app/pages/home.dart';
import 'package:catalog_movie_app/pages/profile.dart';
import 'package:catalog_movie_app/pages/search.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;

  List<Widget> body = [const HomePage(), const Search(), const Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[700],
        title: Text(
          'Cinemaroot',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: body[index],
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.red[700],
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.search, title: 'Search'),
          TabItem(icon: Icons.person, title: 'About'),
        ],
        initialActiveIndex: index,
        onTap: (int i) {
          setState(() {
            index = i;
          });
        },
      ),
    );
  }
}
