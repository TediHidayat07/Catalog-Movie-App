import 'dart:io';
import 'package:catalog_movie_app/pages/intro_one.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const IntroOne(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/Logo 130.png',
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 8.0),
            Text(
              'Cinemaroot',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 8.0),
            if (Platform.isIOS)
              const CupertinoActivityIndicator(radius: 15)
            else
              const CircularProgressIndicator(color: Colors.white),
          ],
        ),
      ),
    );
  }
}
