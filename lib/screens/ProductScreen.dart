import 'package:burgerking_clone/custom/expandable_text.dart';
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
      padding: const EdgeInsets.fromLTRB(0, 15, 10, 10),
      child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: COLOR_RED,
            primary: COLOR_WHITE,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          ),
          onPressed: () {},
          child: const Text("zu MyBK")),
    );
    Widget imageSection = Container(
      color: COLOR_BROWN,
      width: size.width,
      height: size.height * 0.30,
      child: Image.asset('assets/images/fastfood.png'),
    );

    Widget titleSection = Container(
      child: Column(
        children: const [
          Padding(
            padding: sidePadding,
            child: ExpandableText(),
          ),
        ],
      ),
    );

    Widget menueSection = Container(

    );

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: COLOR_BLACK),
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
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    imageSection,
                    addVerticalSpace(padding * 2),
                    titleSection,
                    const Padding(
                      padding: sidePadding,
                      child: Divider(color: COLOR_GREY, height: padding,),
                    )
                  ],
                ),
              ),
            )));
  }
}
