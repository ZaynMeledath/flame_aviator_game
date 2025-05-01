import 'dart:async';

import 'package:aviator_game/aviator_game.dart';
import 'package:aviator_game/src/configuration.dart';
import 'package:flame/components.dart';
import 'dart:math' as math;

enum Direction { up, down }

class AviatorPlane extends SpriteAnimationComponent
    with HasGameRef<AviatorGame> {
  Direction currentDirection = Direction.down;

  double time = 0;

  Vector2 _velocity = Vector2(0, 0);

  @override
  FutureOr<void> onLoad() async {
    // Load the sprites
    final plane1 = await Sprite.load('fly_1.png');
    final plane2 = await Sprite.load('fly_2.png');

    size = Config.planeSize;
    anchor = Anchor.center;
    position = Vector2(
      Config.parallaxDotsWidth + Config.planeSize.x / 2,
      gameRef.size.y - Config.parallaxDotsWidth - Config.planeSize.y / 2,
    );

    // Set the animation to loop for the flying effect
    animation = SpriteAnimation.spriteList(
      [plane1, plane2],
      stepTime: .1,
    );
    return super.onLoad();
  }

  @override
  void update(double dt) {
    if (position.x >= gameRef.size.x * .98 - Config.planeSize.x / 2) {
    } else {
      if (position.x < gameRef.size.x * .28) {
        _velocity.x += Config.takeOffAcceleration.x * dt;
      } else {
        time += dt;
        angle = -0.28 * math.sin(time * 1.1);
        _velocity += Config.takeOffAcceleration * dt;
      }
      position += _velocity * dt;
    }
    super.update(dt);
  }

  void flyAway() {
    //TODO: implement crash logic
  }

  void cashOut() {
    //TODO: implement cashout logic
  }
}




 // if (position.y > 50 && currentDirection == Direction.up) {
    //   position += Vector2(40, -120) * dt;
    // } else if (position.y < gameRef.size.y - 50 &&
    //     currentDirection == Direction.down) {
    //   position += Vector2(-40, 120) * dt;
    // } else {
    //   currentDirection =
    //       currentDirection == Direction.up ? Direction.down : Direction.up;
    // }
