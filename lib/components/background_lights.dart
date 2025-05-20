import 'dart:async';
import 'package:aviator_game/src/configuration.dart';
import 'package:flame/components.dart';
import 'package:flame_lottie/flame_lottie.dart';

class BackgroundLights extends PositionComponent {
  @override
  Future<void> onLoad() async {
    anchor = Anchor.center;
    await super.onLoad();
    final asset =
        Lottie.asset('assets/lotties/background_lights_animation.json');
    final lottie = await loadLottie(asset);

    add(
      LottieComponent(
        lottie,
        size: FlyAwayConfig.backgroundLightsSize,
        position: Vector2(
          -size.x / 2,
          0,
        ),
      ),
    );
  }
}
