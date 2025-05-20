import 'package:aviator_game/utils/screen_size.dart';
import 'package:flame/game.dart';

class FlyAwayConfig {
  static double gameWidth = 400.0;
  static double gameHeight = 350.0;
  static Vector2 planeSize = Vector2(80, 50);
  static Vector2 backgroundLightsSize = Vector2(300, 300);
  static Vector2 takeOffAcceleration = Vector2(150, -230);
  static double parallaxDotsWidth = 35.0;
  static double parallaxDotsVelocity = 45.0;

  static void init() {
    gameWidth = screenSize.width;
    gameHeight = (screenSize.height * 0.5).h();
    planeSize = Vector2(
      80.w(),
      50.w(),
    );
    backgroundLightsSize = Vector2(
      gameWidth * .8,
      gameWidth * 8,
    );
    takeOffAcceleration = Vector2(
      150.w(),
      -230.h(),
    );
    parallaxDotsVelocity = 35.w();
    parallaxDotsVelocity = 45.w();
  }
}
