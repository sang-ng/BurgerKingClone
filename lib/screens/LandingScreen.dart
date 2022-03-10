import 'package:flutter/material.dart';
import 'package:burgerking_clone/utils/sample_data.dart';
import 'package:burgerking_clone/utils/widget_functions.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    const double padding = 25;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);

    return SafeArea(
      child: Scaffold(body: SizedBox(width: size.width, height: size.height)),
    );
  }
}
