import 'package:aviator_game/aviator_game.dart';
import 'package:aviator_game/src/configuration.dart';
import 'package:aviator_game/utils/screen_size.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class AviatorHomeScreen extends StatefulWidget {
  const AviatorHomeScreen({super.key});

  @override
  State<AviatorHomeScreen> createState() => _AviatorHomeScreenState();
}

class _AviatorHomeScreenState extends State<AviatorHomeScreen> {
  @override
  void initState() {
    FlyAwayConfig.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(30, 36, 40, 1),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: FlyAwayConfig.gameHeight,
                child: GameWidget(game: AviatorGame()),
              ),
              Container(
                width: 180.w(),
                height: 50.h(),
                margin: EdgeInsets.symmetric(
                  vertical: 40.h(),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.red,
                ),
                child: Center(
                  child: Text(
                    'Bet',
                    style: TextStyle(
                      fontSize: 20.w(),
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
