import 'package:authapp/constants.dart';
import 'package:authapp/widgets/nav_circles.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context, int index) {
  return AppBar(
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.white,
    title: NavigationCircles(index: index),
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
            icon: Text('Skip',
                style: TextStyle(
                    fontSize: 18,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w600)),
            onPressed: () {}),
      ),
    ],
    leading: IconButton(
      icon: Icon(Icons.arrow_back),
      color: Colors.black87,
      onPressed: () => Navigator.pop(context),
    ),
  );
}
