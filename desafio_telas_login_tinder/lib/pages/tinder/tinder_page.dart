import 'package:flutter/material.dart';
import 'package:playground1/pages/tinder/widgets/botao.dart';
import 'package:playground1/pages/tinder/widgets/texto_central.dart';

class TinderPage extends StatelessWidget {
  const TinderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            stops: [
              0.1,
              0.9,
            ],
            colors: [
              Color.fromRGBO(234, 74, 119, 1),
              Color.fromRGBO(238, 115, 100, 1),
            ],
          )),
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/tinder_logo.png',
                    height: 120,
                  ),
                ],
              ),
              const Spacer(),
              const TextoCentral(),
              Container(
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                child: const Column(children: [
                  InkWell(
                    child: Botao(
                      text: 'Sign in With Apple',
                      image: 'assets/images/logo.png',
                      icon: Icons.apple,
                    ),
                  ),
                  Botao(
                    text: 'Sign in With Facebook',
                    image: 'assets/images/logo.png',
                    icon: Icons.facebook,
                  ),
                  Botao(
                    text: 'Sign in With Phone Number',
                    image: 'assets/images/logo.png',
                    icon: Icons.message,
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
