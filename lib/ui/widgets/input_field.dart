import 'package:taskio/app/colors/taskio_colors.dart';
import 'package:taskio/app/responsiveness/size_config.dart';
import 'package:taskio/app/responsiveness/config_extensions.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String label;
  final Widget visibility;
  final Function validate;
  final TextEditingController controller;
  final bool obscure;
  final TextCapitalization capitalization;
  final TextInputAction action;
  final TextInputType keyboardType;
  final Function onChanged;
  // final Function focus;

  InputField({
    this.label,
    this.visibility,
    this.validate,
    this.controller,
    this.obscure,
    this.capitalization,
    this.action,
    this.keyboardType,
    this.onChanged
    // this.focus,
  });

  final SizeConfig config = SizeConfig();
  //final focus = FocusNode();
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: TaskioColors.grey[700],
            fontSize: 3.text,
          ),
        ),
        TextFormField(
          style: TextStyle(
            height: 0.12.height,
            fontSize: 4.text,
            color: TaskioColors.grey,
          ),
          cursorColor: TaskioColors.grey[700],
          autofocus: false,
          obscureText: obscure,
          validator: validate,
          controller: controller,
          //onChanged: (value) => controller.text = value,
          onFieldSubmitted: (_) {

            FocusScope.of(context).nextFocus();
          },
          textCapitalization: capitalization,
          textInputAction: action,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            suffixIcon: visibility,
            contentPadding: EdgeInsets.only(
              bottom: -7.height,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: TaskioColors.orange,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: TaskioColors.orange,
              ),
            ),
            disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: TaskioColors.orange,
              ),
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: TaskioColors.orange,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
