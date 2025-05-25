import 'dart:ui';

import 'package:aviator_game/components/aviator_plane.dart';
import 'package:aviator_game/components/sky_background.dart';
import 'package:aviator_game/components/blue_parallax_dots.dart';
import 'package:aviator_game/components/white_parallax_dots.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';

class FlyAwayGame extends FlameGame {
  @override
  Color backgroundColor() => const Color(0xFF000000);

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(SkyBackground());
    // add(BlueParallaxDots());
    // add(WhiteParallaxDots());
    add(AviatorPlane());
  }
}
