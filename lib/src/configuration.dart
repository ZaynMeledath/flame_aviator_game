import 'package:aviator_game/utils/screen_size.dart';
import 'package:flame/game.dart';

class FlyAwayConfig {
  static double gameWidth = 400.0;
  static double gameHeight = 350.0;
  static Vector2 planeSize = Vector2(80, 50);
  static Vector2 skyBackground = Vector2(gameWidth, gameHeight);
  static Vector2 takeOffAcceleration = Vector2(150, -150);
  static double parallaxDotsWidth = 30.0;
  static double parallaxDotsVelocity = 45.0;

  static void init() {
    gameWidth = screenSize.width;
    gameHeight = (screenSize.height * 0.4).h();
    planeSize = Vector2(
      80.w(),
      50.w(),
    );
    skyBackground = Vector2(
      gameWidth,
      gameHeight,
    );
    takeOffAcceleration = Vector2(
      160.w(),
      -150.h(),
    );
    parallaxDotsWidth = 30.w();
    parallaxDotsVelocity = 45.w();
  }
}
