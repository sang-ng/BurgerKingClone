import 'package:burgerking_clone/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:burgerking_clone/utils/sample_data.dart';
import 'package:burgerking_clone/utils/widget_functions.dart';
import 'package:flutter/services.dart';

import '../custom/category_item.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    const double padding = 25;
    const sidePadding = EdgeInsets.symmetric(horizontal: padding);

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: COLOR_BEIGE,
              title: SizedBox(
                width: 40,
                child: Image.asset('assets/images/burger_logo.png'),
              ),
              centerTitle: true,
              actions: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 10, 10),
                  child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: COLOR_RED,
                        primary: COLOR_WHITE,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      ),
                      onPressed: () {},
                      child: const Text("zu MyBK")),
                )
              ],
            ),
            body: SizedBox(
              width: size.width,
              height: size.height,
              child: Container(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          color: COLOR_RED,
                          height: size.height * 0.06,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Unser Menü",
                                style: TextStyle(
                                    color: COLOR_BEIGE,
                                    fontFamily:
                                        themeData.textTheme.headline4?.fontFamily,
                                    fontSize:
                                        themeData.textTheme.headline4?.fontSize),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                            child: Padding(
                              padding: sidePadding,
                              child: GridView.count(
                                physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  crossAxisCount: 2,
                                  children: List.generate(8, (index) {
                                    return CategoryItem();
                                  })),
                            ),
                        ),
                      ],

                    ),
                    addVerticalSpace(padding),

                  ],
                ),
              ),
            )));
  }
}

class CategoryItem extends StatelessWidget {
  final dynamic itemData;

  const CategoryItem({Key? key, this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    const double padding = 25;
    return Container(
      margin: EdgeInsets.all(8),
      width: size.width * 0.4,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            blurRadius: 7,
            color: Color(0x2F1D2429),
            offset: Offset(0, 3),
          )
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: const Radius.circular(0),
                bottomRight: Radius.circular(0),
                topLeft: const Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              child: Image.asset('assets/images/fastfood.png',
                  width: double.infinity, height: 100, fit: BoxFit.cover),
            ),
            Padding(
              padding: EdgeInsets.only(top: padding),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Burger',
                    style: TextStyle(
                        fontFamily: themeData.textTheme.headline5?.fontFamily,
                        color: COLOR_BROWN,
                        fontSize: themeData.textTheme.headline5?.fontSize),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
