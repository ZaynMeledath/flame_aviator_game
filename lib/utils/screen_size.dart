import 'package:flutter/material.dart' show Size, MediaQuery, BuildContext;

Size realScreenSize = const Size(0, 0);
Size screenSize = const Size(0, 0);
const defaultScreenSize = Size(400, 900);
final defaultAspectRatio = defaultScreenSize.width / defaultScreenSize.height;

void getInitialScreenSize({required BuildContext context}) {
  screenSize = MediaQuery.of(context).size;
  final safeArea = MediaQuery.of(context).padding.top;
  realScreenSize = screenSize;
  screenSize = Size(screenSize.width, screenSize.height - safeArea);
  if (screenSize.width > 550) {
    screenSize = Size(550, screenSize.height);
  }
  if (screenSize.height < screenSize.width * 2) {
    screenSize = Size((screenSize.height / 2).clamp(0, 550), screenSize.height);
  }
}

//====================Responsive Extension on double====================//
extension ToResponsiveDouble on double {
  double w() {
    final percentageValue = this / defaultScreenSize.width;

    final maxWidth = screenSize.width * percentageValue;

    final currentAspectRatio = screenSize.width / screenSize.height;

    final finalAspectRatio = currentAspectRatio / defaultAspectRatio;

    double calculatedWidth = (maxWidth / finalAspectRatio).clamp(
      -maxWidth.abs(),
      maxWidth.abs(),
    );
    return calculatedWidth;
  }

  double h() {
    final percentageValue = this / defaultScreenSize.height;

    final maxHeight = screenSize.height * percentageValue;

    final currentAspectRatio = screenSize.width / screenSize.height;

    final finalAspectRatio = currentAspectRatio / defaultAspectRatio;

    double calculatedHeight = (maxHeight / finalAspectRatio).clamp(
      -maxHeight.abs(),
      maxHeight.abs(),
    );
    return calculatedHeight;
  }
}

//====================Responsive Extension on int====================//
extension ToResponsiveInt on int {
  double w() {
    final percentageValue = this / defaultScreenSize.width;

    final maxWidth = screenSize.width * percentageValue;

    final currentAspectRatio = screenSize.width / screenSize.height;

    final finalAspectRatio = currentAspectRatio / defaultAspectRatio;

    double calculatedWidth = (maxWidth / finalAspectRatio).clamp(
      -maxWidth.abs(),
      maxWidth.abs(),
    );
    return calculatedWidth;
  }

  double h() {
    final percentageValue = this / defaultScreenSize.height;

    final maxHeight = screenSize.height * percentageValue;

    final currentAspectRatio = screenSize.width / screenSize.height;

    final finalAspectRatio = currentAspectRatio / defaultAspectRatio;

    double calculatedHeight = (maxHeight / finalAspectRatio).clamp(
      -maxHeight.abs(),
      maxHeight.abs(),
    );

    return calculatedHeight;
  }
}
