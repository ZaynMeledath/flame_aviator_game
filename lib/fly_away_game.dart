import 'dart:ui';

import 'package:aviator_game/components/aviator_plane.dart';
import 'package:aviator_game/components/lights_background.dart';
import 'package:aviator_game/components/blue_parallax_dots.dart';
import 'package:aviator_game/components/white_parallax_dots.dart';
import 'package:aviator_game/src/configuration.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';

class FlyAwayGame extends FlameGame {
  @override
  Color backgroundColor() => const Color(0xFF000000);

  late LightsBackground background;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    final clip = ClipComponent.rectangle(
      size: Vector2(
        FlyAwayConfig.gameWidth,
        FlyAwayConfig.gameHeight,
      ),
    );
    background = LightsBackground();
    clip.add(background);

    addAll([
      clip,
      AviatorPlane(),
    ]);
  }

  @override
  void update(double dt) {
    background.angle += .7 * dt;
    super.update(dt);
  }
}
