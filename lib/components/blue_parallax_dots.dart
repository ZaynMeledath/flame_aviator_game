import 'dart:async';

import 'package:aviator_game/aviator_game.dart';
import 'package:aviator_game/src/configuration.dart';
import 'package:aviator_game/src/fly_away_assets.dart';
import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/painting.dart';

class BlueParallaxDots extends ParallaxComponent<AviatorGame> {
  BlueParallaxDots()
      : super(
          size: Vector2(
            FlyAwayConfig.parallaxDotsWidth,
            FlyAwayConfig.gameHeight - FlyAwayConfig.parallaxDotsWidth * .5,
          ),
          position: Vector2.zero(),
          anchor: Anchor.topLeft,
        );

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    parallax = await game.loadParallax(
      [
        ParallaxImageData(FlyAwayAssets.blueDots),
      ],
      baseVelocity: Vector2(
          0, -FlyAwayConfig.parallaxDotsVelocity), // Moves from top to bottom
      repeat: ImageRepeat.repeatY,
      fill: LayerFill.width,
    );
  }
}
