import 'dart:async';

import 'package:aviator_game/fly_away_game.dart';
import 'package:aviator_game/src/configuration.dart';
import 'package:aviator_game/src/fly_away_assets.dart';
import 'package:flame/components.dart';
import 'dart:math' as math;

enum Direction { up, down }

class AviatorPlane extends SpriteAnimationComponent
    with HasGameRef<FlyAwayGame> {
  Direction currentDirection = Direction.up;

  double time = 0;
  double currentPosition = 0;
  double lastPosition = 0;
  bool? stopAcceleration;
  final planeCruiseFlyPosition =
      FlyAwayConfig.gameWidth * .95 - FlyAwayConfig.planeSize.x / 2;

  Vector2 _velocity = Vector2(0, 0);

  @override
  FutureOr<void> onLoad() async {
    // Load the sprites
    final plane1 = await Sprite.load(FlyAwayAssets.fly1);
    final plane2 = await Sprite.load(FlyAwayAssets.fly2);

    size = FlyAwayConfig.planeSize;
    anchor = Anchor.center;
    position = Vector2(
      FlyAwayConfig.parallaxDotsWidth + FlyAwayConfig.planeSize.x / 2,
      gameRef.size.y -
          FlyAwayConfig.parallaxDotsWidth -
          FlyAwayConfig.planeSize.y / 2,
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
    if ((position.x >= planeCruiseFlyPosition) || lastPosition != 0) {
      cruiseFly(dt);
    } else {
      takeOff(dt);
    }
    super.update(dt);
  }

//====================Take Off====================//
  void takeOff(dt) {
    if (position.x < gameRef.size.x * .28) {
      _velocity.x += FlyAwayConfig.takeOffAcceleration.x * dt;
    } else if (position.x > gameRef.size.x * .5) {
      time += dt;
      angle = -0.30 * math.sin(time * 1.1);

      final distanceLeft = planeCruiseFlyPosition - gameRef.size.x * .5;
      final velocityX = distanceLeft / FlyAwayConfig.takeOffAcceleration.x;
      final velocityY = distanceLeft / FlyAwayConfig.takeOffAcceleration.y;

      // _velocity.x -= FlyAwayConfig.takeOffAcceleration.x * dt;
      // _velocity.y += FlyAwayConfig.takeOffAcceleration.y * dt;
      // _velocity -= Vector2(velocityX, velocityY) * dt;
      // _velocity.clamp(Vector2.all(0), Vector2.all(10000));
      _velocity.x -= velocityX * dt;
      _velocity.y += velocityY * dt;
    } else {
      time += dt;
      angle = -0.30 * math.sin(time * 1.1);
      _velocity += FlyAwayConfig.takeOffAcceleration * dt;
    }
    position += _velocity * dt;
  }

//====================Cruise Fly====================//
  void cruiseFly(dt) {
    if (lastPosition == 0) {
      lastPosition = position.y;
    }
    if (position.y > lastPosition - 50 && currentDirection == Direction.up) {
      position -= Vector2(20, 24) * dt;
    } else if (position.y < lastPosition &&
        currentDirection == Direction.down) {
      position += Vector2(20, 24) * dt;
    } else {
      currentDirection =
          currentDirection == Direction.up ? Direction.down : Direction.up;
    }
  }

//====================Fly Away====================//
  void flyAway() {
    //TODO: implement crash logic
  }

//====================Cash Out====================//
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
