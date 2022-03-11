import 'package:burgerking_clone/utils/colors.dart';
import 'package:burgerking_clone/utils/sample_data.dart';
import 'package:burgerking_clone/utils/widget_functions.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    const double padding = 25;
    const sidePadding = EdgeInsets.symmetric(horizontal: padding);

    Widget appBarButton = Padding(
      padding: EdgeInsets.fromLTRB(0, 15, 10, 10),
      child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: COLOR_RED,
            primary: COLOR_WHITE,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          ),
          onPressed: () {},
          child: const Text("zu MyBK")),
    );
    Widget imageSection = Container(
      color: COLOR_BROWN,
      width: size.width,
      height: size.height * 0.40,
      child: Image.asset('assets/images/fastfood.png'),
    );
    Widget titleSection = Container(
      child: Column(
        children: [
          Text(
            "Kings Pastrami Double",
            style: TextStyle(
                fontFamily: themeData.textTheme.headline5?.fontFamily,
                color: COLOR_BROWN,
                fontSize: themeData.textTheme.headline5?.fontSize),
          ),
          addVerticalSpace(padding),
          Padding(
            padding: sidePadding,
            child: Text(
              "Hol dir sidesn super mother fucing leckern Snadwichsdfssssssssssdffffffffisaudgfsdpiouhnspdiouhnpsdiufgnpsdiufbpdsigssssssssss Klassiker",
              maxLines: 2,
              style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontFamily: themeData.textTheme.bodyText1?.fontFamily,
                  fontWeight: FontWeight.bold,
                  color: COLOR_BROWN,
                  fontSize: themeData.textTheme.bodyText1?.fontSize),
            ),
          ),
        ],
      ),
    );

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: COLOR_BLACK),
                onPressed: () => Navigator.of(context).pop(),
              ),
              elevation: 0.0,
              backgroundColor: COLOR_BEIGE,
              title: SizedBox(
                width: 40,
                child: Image.asset('assets/images/burger_logo.png'),
              ),
              centerTitle: true,
              actions: [
                appBarButton,
              ],
            ),
            body: SizedBox(
              width: size.width,
              height: size.height,
              child: Container(
                child: Column(
                  children: [
                    imageSection,
                    addVerticalSpace(padding),
                    titleSection
                  ],
                ),
              ),
            )));
  }
}
