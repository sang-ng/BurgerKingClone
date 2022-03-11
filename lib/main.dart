import 'package:burgerking_clone/utils/colors.dart';
import 'package:burgerking_clone/utils/text_theme.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:burgerking_clone/utils/constants.dart';
import 'package:burgerking_clone/screens/LandingScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = window.physicalSize.width;

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: screenWidth < 500 ? smallText : defaultText,
        scaffoldBackgroundColor: COLOR_BEIGE
      ),
      home: const LandingScreen(),
    );
  }
}
