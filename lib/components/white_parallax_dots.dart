import 'dart:async';

import 'package:aviator_game/aviator_game.dart';
import 'package:aviator_game/src/configuration.dart';
import 'package:aviator_game/src/fly_away_assets.dart';
import 'package:flame/components.dart';
import 'package:flame/parallax.dart';

class WhiteParallaxDots extends ParallaxComponent<AviatorGame> {
  WhiteParallaxDots()
      : super(
          anchor: Anchor.bottomRight,
          size: Vector2(
            FlyAwayConfig.gameWidth - FlyAwayConfig.parallaxDotsWidth * .5,
            FlyAwayConfig.parallaxDotsWidth,
          ),
          position: Vector2(
            FlyAwayConfig.gameWidth,
            FlyAwayConfig.gameHeight,
          ),
        );

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    parallax = await game.loadParallax(
      [
        ParallaxImageData(FlyAwayAssets.whiteDots),
      ],
      baseVelocity: Vector2(FlyAwayConfig.parallaxDotsVelocity, 0),
    );
  }
}
