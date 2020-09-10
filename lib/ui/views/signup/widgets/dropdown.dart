import 'package:flutter/material.dart';
import 'package:taskio/app/colors/taskio_colors.dart';
import 'package:taskio/app/responsiveness/size_config.dart';
import 'package:taskio/app/responsiveness/config_extensions.dart';

class DropDown extends StatelessWidget {
  final String label;
  final FormFieldState<String> state;
  final String value;
  final Function onChanged;
  final List<DropdownMenuItem<String>> items;

  DropDown({this.label, this.state, this.value, this.onChanged, this.items});

  final SizeConfig config = SizeConfig();
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
        FormField<String>(
          builder: (state) {
            return InputDecorator(
              decoration: InputDecoration(
                //errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: TaskioColors.orange),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: TaskioColors.orange),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: TaskioColors.orange),
                ),
                disabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: TaskioColors.orange),
                ),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: TaskioColors.orange),
                ),
                focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: TaskioColors.orange),
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                    icon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.width),
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: TaskioColors.grey[700],
                      ),
                    ),
                    iconSize: 3.5.height,
                    value: value,
                    isDense: true,
                    onChanged: onChanged,
                    // (String newValue) {
                    //   model.selectedLevel = newValue;
                    //   model.stateDidChange(state, newValue);
                    //   //state.didChange(newValue);
                    //   print(model.selected);
                    //   // setState(() {
                    //   //   _currentSelectedValue = newValue;
                    //   //   state.didChange(newValue);
                    //   // });
                    // },
                    items: items
                    // model.userLevels.map((String value) {
                    //   return DropdownMenuItem<String>(
                    //     value: value,
                    //     child: Text(value),
                    //   );
                    // }).toList(),
                    ),
              ),
            );
          },
        ),
      ],
    );
  }
}
