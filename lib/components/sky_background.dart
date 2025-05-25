import 'dart:async';
import 'package:aviator_game/fly_away_game.dart';
import 'package:aviator_game/src/configuration.dart';
import 'package:aviator_game/src/fly_away_assets.dart';
import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/parallax.dart';
import 'package:flame_lottie/flame_lottie.dart';

class SkyBackground extends ParallaxComponent<FlyAwayGame> {
  // SkyBackground()
  //     : super(
  //         size: Vector2(
  //           FlyAwayConfig.gameWidth,
  //           FlyAwayConfig.gameHeight,
  //         ),
  //         position: Vector2.zero(),

  //       );
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    parallax = await game.loadParallax(
      [
        ParallaxImageData(FlyAwayAssets.skyBackground),
      ],
      baseVelocity: Vector2(FlyAwayConfig.parallaxDotsVelocity, 0),
    );

    // final asset = Lottie.asset(FlyAwayAssets.skyLottie);
    // final lottie = await loadLottie(asset);
    // debugMode = true;
    // // anchor = Anchor.center;
    // size = FlyAwayConfig.skyBackground;
    // add(
    //   LottieComponent(
    //     lottie,
    //     size: FlyAwayConfig.skyBackground,
    //     position: Vector2(
    //       FlyAwayConfig.gameWidth / 2,
    //       FlyAwayConfig.gameHeight / 2,
    //     ),
    //     repeating: true,
    //     anchor: Anchor.center,
    //   ),
    // );
  }
}
