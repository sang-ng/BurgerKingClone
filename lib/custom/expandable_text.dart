import 'package:burgerking_clone/utils/widget_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class ExpandableText extends StatefulWidget {
  const ExpandableText({Key? key}) : super(key: key);

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _isReadMore = false;

  @override
  Widget build(BuildContext context) {

    final ThemeData themeData = Theme.of(context);
    const double padding = 25;

    return Container(
      child: Column(
        children: [
          Text(
            'Kings Pastrami Style',
            style: TextStyle(
                fontFamily: themeData.textTheme.headline5?.fontFamily,
                color: COLOR_BROWN,
                fontSize: themeData.textTheme.headline5?.fontSize),
          ),
          addVerticalSpace(padding),
          //text widget to display long text
          buildText(
              "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."),
          TextButton(
              onPressed: () {
                setState(() {
                  // toggle the bool variable true or false
                  _isReadMore = !_isReadMore;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text((_isReadMore ? 'Weniger anzeigen' : 'Mehr anzeigen'), style: TextStyle(
                      fontFamily: themeData.textTheme.bodyText1?.fontFamily,
                      color: COLOR_BROWN,
                      fontSize: themeData.textTheme.bodyText1?.fontSize),),
                  Icon(_isReadMore ? Icons.arrow_drop_up_sharp : Icons.arrow_drop_down_sharp, color: COLOR_BROWN,)
                ],
              ))
        ],
      ),
    );
  }

  Widget buildText(String text) {
    final ThemeData themeData = Theme.of(context);

    // if read more is false then show only 3 lines from text
    // else show full text
    final lines = _isReadMore ? null : 2;
    return Text(
      text,
      style: TextStyle(
          fontFamily: themeData.textTheme.bodyText1?.fontFamily,
          color: COLOR_BROWN,
          fontSize: themeData.textTheme.bodyText1?.fontSize),
      maxLines: lines,
      // overflow properties is used to show 3 dot in text widget
      // so that user can understand there are few more line to read.
      overflow: _isReadMore ? TextOverflow.visible : TextOverflow.ellipsis,
    );
  }
}
