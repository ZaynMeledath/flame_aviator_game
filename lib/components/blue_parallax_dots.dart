import 'dart:async';

import 'package:aviator_game/aviator_game.dart';
import 'package:aviator_game/src/configuration.dart';
import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/painting.dart';

class BlueParallaxDots extends ParallaxComponent<AviatorGame> {
  BlueParallaxDots()
      : super(
          size: Vector2(
            Config.parallaxDotsWidth,
            Config.gameHeight - Config.parallaxDotsWidth * .5,
          ),
          position: Vector2.zero(),
          anchor: Anchor.topLeft,
        );

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    parallax = await game.loadParallax(
      [
        ParallaxImageData('aviator_game_dots_blue.png'),
      ],
      baseVelocity:
          Vector2(0, -Config.parallaxDotsVelocity), // Moves from top to bottom
      repeat: ImageRepeat.repeatY,
      fill: LayerFill.width,
    );
  }
}
