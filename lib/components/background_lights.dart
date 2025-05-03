import 'dart:async';

import 'package:aviator_game/utils/screen_size.dart';
import 'package:flame/components.dart';
import 'package:flame_lottie/flame_lottie.dart';

class BackgroundLights extends PositionComponent {
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    final asset = Lottie.asset('assets/lottie/background_lights.json');
    final lottie = await loadLottie(asset);

    add(
      LottieComponent(
        lottie,
        size: Vector2(
          screenSize.width * .8,
          screenSize.width * .8,
        ),
        position: Vector2(
          -screenSize.width * .4,
          0,
        ),
      ),
    );
  }
}
