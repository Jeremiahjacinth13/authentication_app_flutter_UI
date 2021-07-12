import 'package:flutter/material.dart';
import 'package:authapp/constants.dart';

class NavigationCircles extends StatelessWidget {
  const NavigationCircles({Key? key, this.index = 0}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 3.0),
            height: 6,
            width: 6,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index == 0 ? kPrimaryColor : kLightColor),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 3.0),
            height: 6,
            width: 6,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index == 1 ? kPrimaryColor : kLightColor),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 3.0),
            height: 6,
            width: 6,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index == 2 ? kPrimaryColor : kLightColor),
          )
        ]));
  }
}
