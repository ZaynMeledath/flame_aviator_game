import 'package:flutter/material.dart';

Size realScreenSize = const Size(0, 0);
Size screenSize = const Size(0, 0);

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
