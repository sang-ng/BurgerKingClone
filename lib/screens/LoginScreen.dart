import 'package:burgerking_clone/custom/expandable_text.dart';
import 'package:burgerking_clone/utils/colors.dart';
import 'package:burgerking_clone/utils/sample_data.dart';
import 'package:burgerking_clone/utils/widget_functions.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/scheduler.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    const double padding = 25;
    const sidePadding = EdgeInsets.symmetric(horizontal: 25);

    Widget logoSection = Container(
      width: size.width,
      height: size.height * 0.10,
      child: Image.asset("assets/images/burger_logo.png"),
    );

    Widget registrierung = SingleChildScrollView(
      padding: const EdgeInsets.only(top: padding * 2),
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: sidePadding,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide()),
                  labelText: 'Vorname *',
                  labelStyle: TextStyle(
                      fontFamily: themeData.textTheme.headline6?.fontFamily,
                      color: COLOR_BROWN,
                      fontSize: themeData.textTheme.headline6?.fontSize)),
              onSaved: (String? value) {
                // This optional block of code can be used to run
                // code when the user saves the form.
              },
              validator: (String? value) {
                return (value != null && value.contains('@'))
                    ? 'Do not use the @ char.'
                    : null;
              },
            ),
            addVerticalSpace(padding),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide()),
                  labelText: 'E-Mail-Adresse *',
                  labelStyle: TextStyle(
                      fontFamily: themeData.textTheme.headline6?.fontFamily,
                      color: COLOR_BROWN,
                      fontSize: themeData.textTheme.headline6?.fontSize)),
              onSaved: (String? value) {
                // This optional block of code can be used to run
                // code when the user saves the form.
              },
              validator: (String? value) {
                return (value != null && value.contains('@'))
                    ? 'Do not use the @ char.'
                    : null;
              },
            ),
            addVerticalSpace(padding),
            Container(
              width: size.width,
              decoration: const BoxDecoration(
                  color: COLOR_RED,
                  borderRadius:
                  BorderRadius.all(Radius.circular(15))),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Jetzt registrieren",
                  style: TextStyle(
                      fontFamily:
                      themeData.textTheme.headline6?.fontFamily,
                      color: COLOR_WHITE,
                      fontSize:
                      themeData.textTheme.headline6?.fontSize),
                ),
              ),
            )
          ],
        ),
      ),
    );

    // Widget anmeldung = Container(
    //   child: Row(children: [
    //     TextFormField(),
    //     TextButton(onPressed: onPressed, child: child)
    //   ],),
    // )

    Widget tabView = DefaultTabController(
        length: 2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: COLOR_WHITE,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: TabBar(
                indicatorColor: COLOR_RED,
                indicatorWeight: 3.0,
                tabs: [
                  Padding(
                    padding: const EdgeInsets.all(padding),
                    child: Text("zu MyBK",
                        style: TextStyle(
                            fontFamily:
                                themeData.textTheme.headline6?.fontFamily,
                            color: COLOR_BROWN,
                            fontSize: themeData.textTheme.headline6?.fontSize)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(padding),
                    child: Text("Anmelden",
                        style: TextStyle(
                            fontFamily:
                                themeData.textTheme.headline6?.fontFamily,
                            color: COLOR_BROWN,
                            fontSize: themeData.textTheme.headline6?.fontSize)),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 2,
              // thickness of the line
              color: COLOR_GREY.withAlpha(100),
              // The color to use when painting the line.
              height: 2, // The divider's height extent.
            ),
            Expanded(
              child: Container(
                color: COLOR_WHITE,
                child: TabBarView(
                  children: [
                    registrierung,
                    Icon(Icons.directions_transit),
                  ],
                ),
              ),
            ),
          ],
        ));

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: COLOR_BLACK),
                onPressed: () => Navigator.of(context).pop(),
              ),
              elevation: 0.0,
              backgroundColor: COLOR_BEIGE,
            ),
            body: Stack(
              children: [
                Column(
                  children: [
                    logoSection,
                    addVerticalSpace(padding * 2),
                    Expanded(child: tabView),
                  ],
                ),

              ],
            )));
  }
}

