import 'dart:async';

import 'package:aviator_game/aviator_game.dart';
import 'package:aviator_game/src/configuration.dart';
import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:get/get.dart';

class WhiteParallaxDots extends ParallaxComponent<AviatorGame> {
  WhiteParallaxDots()
      : super(
          anchor: Anchor.bottomRight,
          size: Vector2(
            Get.width - Config.parallaxDotsWidth * .5,
            Config.parallaxDotsWidth,
          ),
          position: Vector2(
            Get.width,
            Config.gameHeight,
          ),
        );

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    parallax = await game.loadParallax(
      [
        ParallaxImageData('aviator_game_dots_white.png'),
      ],
      baseVelocity: Vector2(Config.parallaxDotsVelocity, 0),
    );
  }
}
