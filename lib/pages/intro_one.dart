import 'package:flutter/material.dart';
import 'package:catalog_movie_app/pages/intro_two.dart';

class IntroOne extends StatelessWidget {
  const IntroOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('images/Onboarding 1.png', width: 250, height: 180),
              const SizedBox(height: 16.0),
              Text(
                'Temukan Film Keinginan',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'Anda Disini',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8.0),
              Text(
                'sebarkan sorak sorai membaca katalogmu',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Text(
                'kapan saja dan dimana saja',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 60.0),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const IntroTwo(),
                        ),
                        (route) => false);
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.red[700],
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 10)),
                  child: const Text(
                    'Lanjutkan',
                    style: TextStyle(fontFamily: 'Viga', fontSize: 18),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
