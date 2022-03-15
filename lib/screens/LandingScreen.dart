import 'package:burgerking_clone/screens/LoginScreen.dart';
import 'package:burgerking_clone/utils/colors.dart';
import 'package:burgerking_clone/utils/sample_data.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    const double padding = 25;
    const sidePadding = EdgeInsets.symmetric(horizontal: padding);

    Widget titleSection = Container(
      color: COLOR_RED,
      height: size.height * 0.06,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Unser Menü",
            style: TextStyle(
                color: COLOR_BEIGE,
                fontFamily: themeData.textTheme.headline4?.fontFamily,
                fontSize: themeData.textTheme.headline4?.fontSize),
          )
        ],
      ),
    );
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
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LoginScreen()));
          },
          child: const Text("zu MyBK")),
    );
    Widget gridView = Expanded(
        child: Padding(
      padding: sidePadding,
      child: GridView.builder(
        itemCount: CATEGORIES.length,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          return CategoryItem(
            itemData: CATEGORIES[index],
          );
        },
      ),
    ));

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
                appBarButton,
              ],
            ),
            body: SizedBox(
              width: size.width,
              height: size.height,
              child: Container(
                child: Column(
                  children: [titleSection, gridView],
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
      margin: const EdgeInsets.all(8),
      width: size.width * 0.4,
      height: size.height * 0.35,
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
            Container(
              decoration: BoxDecoration(
                  color: itemData["color"],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  )),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                child: Image.asset(itemData["image"],
                    width: double.infinity, height: 120, scale: 0.5,),
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    (itemData["name"]),
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
