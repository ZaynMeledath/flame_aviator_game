import 'package:aviator_game/utils/screen_size.dart';
import 'package:flame/game.dart';

class Config {
  static double gameWidth = 400.0;
  static double gameHeight = 350.0;
  static Vector2 planeSize = Vector2(80, 50);
  static Vector2 takeOffAcceleration = Vector2(150, -230);
  static double parallaxDotsWidth = 35.0;
  static double parallaxDotsVelocity = 45.0;

  static void updateConfigValues() {
    gameHeight = screenSize.height * 0.4;
    gameWidth = screenSize.width;
    planeSize = Vector2(
      gameWidth * .19,
      gameWidth * .12,
    );
    takeOffAcceleration = Vector2(
      gameWidth * .36,
      -(gameWidth * .55),
    );
    parallaxDotsWidth = gameWidth * .085;
    parallaxDotsVelocity = gameWidth * .11;
  }
}
