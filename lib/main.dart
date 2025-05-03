import 'package:aviator_game/aviator_home_screen.dart';
import 'package:aviator_game/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const AviatorApp());
}

class AviatorApp extends StatelessWidget {
  const AviatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    getInitialScreenSize(context: context);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aviator Game',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const AviatorHomeScreen(),
    );
  }
}
