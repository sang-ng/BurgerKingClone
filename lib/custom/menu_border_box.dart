import 'package:flutter/cupertino.dart';

class MenuItem extends StatefulWidget {
  final String name;
  final String description;
  final Image image;

  const MenuItem(
      {Key? key,
      required this.name,
      required this.description,
      required this.image})
      : super(key: key);

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
