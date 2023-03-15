import 'package:flutter/material.dart';

class BMICard extends StatelessWidget {
  BMICard({@required this.widgetColor, this.cardChild, this.onPress});

  final Color widgetColor;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: widgetColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
