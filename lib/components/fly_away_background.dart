import 'dart:async';
import 'package:aviator_game/src/configuration.dart';
import 'package:aviator_game/src/fly_away_assets.dart';
import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame_lottie/flame_lottie.dart';

class FlyAwayBackground extends ClipComponent {
  FlyAwayBackground()
      : super(
          size: Vector2(
            FlyAwayConfig.gameWidth,
            FlyAwayConfig.gameHeight,
          ),
          position: Vector2.zero(),
          builder: (size) => Rectangle.fromLTWH(
            0,
            0,
            size.x,
            size.y,
          ),
        );
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    final asset = Lottie.asset(FlyAwayAssets.skyLottie);
    final lottie = await loadLottie(asset);
    debugMode = true;
    // anchor = Anchor.center;
    add(
      LottieComponent(
        lottie,
        size: FlyAwayConfig.backgroundLightsSize,
        position: Vector2(
          0,
          FlyAwayConfig.gameHeight / 2,
        ),
        repeating: true,
        anchor: Anchor.center,
      ),
    );
  }
}
