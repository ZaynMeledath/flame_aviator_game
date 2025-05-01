import 'package:aviator_game/aviator_game.dart';
import 'package:aviator_game/src/configuration.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const AviatorApp());
}

class AviatorApp extends StatelessWidget {
  const AviatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aviator Game',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const AviatorHomeScreen(),
    );
  }
}

class AviatorHomeScreen extends StatelessWidget {
  const AviatorHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(30, 36, 40, 1),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: Config.gameHeight,
                child: GameWidget(game: AviatorGame()),
              ),
              Container(
                width: 180,
                height: 50,
                margin: const EdgeInsets.symmetric(
                  vertical: 40,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.red,
                ),
                child: const Center(
                  child: Text(
                    'Bet',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
