import 'package:flutter/material.dart';
import 'package:catalog_movie_app/pages/main_page.dart';

class IntroTwo extends StatefulWidget {
  const IntroTwo({Key? key}) : super(key: key);

  @override
  State<IntroTwo> createState() => _IntroTwoState();
}

class _IntroTwoState extends State<IntroTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('images/Onboarding 2.png', width: 250, height: 180),
              const SizedBox(height: 16),
              Text(
                'A Stopover For You',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12.0),
              Text(
                'Because film and lying down are the perfect blend',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 70.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainPage(),
                      ),
                      (route) => false);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red[700],
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 10, bottom: 10),
                ),
                child: const Text(
                  'Lanjutkan',
                  style: TextStyle(fontFamily: 'Viga', fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
