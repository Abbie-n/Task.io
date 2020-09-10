import 'package:taskio/app/responsiveness/size_config.dart';
import 'package:taskio/app/responsiveness/config_extensions.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final dynamic function;
  final double elevation;
  final double radius;
  final Color color;
  final Color textColor;
  final borderColor;
  CustomButton(
      {@required this.text,
      @required this.function,
      this.elevation,
      this.radius,
      @required this.color,
      @required this.textColor,
      this.borderColor});

  final SizeConfig config = SizeConfig();
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return MaterialButton(
      elevation: elevation,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
          side: BorderSide(
            color: borderColor,
          )),
      color: color,
      onPressed: function,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 5.text,
          ),
        ),
      ),
    );
  }
}
