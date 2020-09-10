import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskio/app/colors/taskio_colors.dart';
import 'package:taskio/app/responsiveness/size_config.dart';
import 'package:taskio/app/responsiveness/config_extensions.dart';
import 'package:taskio/ui/views/signup/signup_viewmodel.dart';
import 'package:taskio/ui/widgets/custom_button.dart';
import 'package:taskio/ui/views/signup/widgets/dropdown.dart';
import 'package:taskio/ui/widgets/input_field.dart';

class SignupView extends StatelessWidget {
  final SizeConfig config = SizeConfig();
  // final _signup = GlobalKey<FormState>();
  final focus = FocusNode();
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    var model = Provider.of<SignupViewModel>(context);
    return Scaffold(
      backgroundColor: TaskioColors.white,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 10.width,
            vertical: 5.height,
          ),
          child: SingleChildScrollView(
            child: Form(
              key: model.signup,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Welcome to Task.io!',
                      style: TextStyle(
                        fontSize: 10.text,
                        color: TaskioColors.orange,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4.height,
                  ),
                  InputField(
                    label: 'Full Name',
                    controller: model.fullname,
                    obscure: false,
                    validate: (String value) {
                      if (value.isEmpty) return 'Field cannot be empty';
                      return null;
                    },
                    onChanged: (value) {
                      model.fullname.text = value;
                    },
                    capitalization: TextCapitalization.sentences,
                    action: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    // focus: (_) {
                    //   FocusScope.of(context).nextFocus();
                    // },
                  ),
                  SizedBox(
                    height: 2.height,
                  ),
                  InputField(
                    label: 'Email Address',
                    controller: model.email,
                    obscure: false,
                    validate: (String value) {
                      if (value.isEmpty)
                        return 'Field cannot be empty';
                      else if (model.emailValidator(value.trim()) == false)
                        return 'Please provide a valid email address';

                      return null;
                    },
                    onChanged: (value) {
                      model.email.text = value;
                    },
                    capitalization: TextCapitalization.none,
                    action: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    // focus: (_) {
                    //   FocusScope.of(context).nextFocus();
                    // },
                  ),
                  SizedBox(
                    height: 2.height,
                  ),
                  DropDown(
                    state: model.state,
                    label: 'Access level',
                    value: model.selected,
                    onChanged: (String newValue) {
                      model.selectedLevel = newValue;
                      //model.stateDidChange(newValue);
                      print(model.selected);
                    },
                    items: model.userLevels.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 2.height,
                  ),
                  Stack(
                    children: [
                      InputField(
                        label: 'Password',
                        controller: model.password,
                        obscure: model.visible,
                        validate: (String value) {
                          if (value.isEmpty)
                            return 'Field cannot be empty';
                          else if (value.length < 7)
                            return 'Password should be up to 7 characters';

                          return null;
                        },
                        onChanged: (value) {
                          model.password.text = value;
                        },
                        // visibility: Padding(
                        //   padding: EdgeInsets.symmetric(horizontal: 2.width),
                        //   child: IconButton(
                        //     icon: !model.visible
                        //         ? Icon(Icons.visibility)
                        //         : Icon(Icons.visibility_off),
                        //     onPressed: model.setVisible,
                        //   ),
                        // ),
                        capitalization: TextCapitalization.none,
                        action: TextInputAction.next,
                        keyboardType: TextInputType.visiblePassword,
                        // focus: (_) {
                        //   FocusScope.of(context).nextFocus();
                        // },
                      ),
                      Positioned(
                        left: 65.width,
                        top: 1.5.height,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.width),
                          child: IconButton(
                            color: TaskioColors.grey[700],
                            icon: !model.visible
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off),
                            onPressed: model.setVisible,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.height,
                  ),
                  Stack(
                    children: [
                      InputField(
                        label: 'Confirm Password',
                        controller: model.confirmPassword,
                        obscure: model.secondVisible,
                        validate: (String value) {
                          if (value.isEmpty) return 'Field cannot be empty';
                          if (value != model.password.text)
                            return 'Password does not match!';
                          return null;
                        },
                        // visibility: Padding(
                        //   padding: EdgeInsets.symmetric(horizontal: 2.width),
                        //   child: IconButton(
                        //     icon: !model.secondVisible
                        //         ? Icon(Icons.visibility)
                        //         : Icon(Icons.visibility_off),
                        //     onPressed: model.setSecondVisible,
                        //   ),
                        // ),
                        capitalization: TextCapitalization.none,
                        action: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        // focus: (_) {
                        //   FocusScope.of(context).unfocus();
                        // },
                      ),
                      Positioned(
                        left: 65.width,
                        top: 1.5.height,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.width),
                          child: IconButton(
                            color: TaskioColors.grey[700],
                            icon: !model.secondVisible
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off),
                            onPressed: model.setSecondVisible,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.height,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 6.height,
                      width: 40.width,
                      margin: EdgeInsets.only(bottom: 1.5.height),
                      child: CustomButton(
                        text: 'Register',
                        function: () {
                          model.formValidation(context);
                        },

                        // () {
                        //   if (_signup.currentState.validate())
                        //     model.navigateToVerificationView();
                        // },
                        color: TaskioColors.black,
                        textColor: TaskioColors.grey[600],
                        borderColor: TaskioColors.black,
                        elevation: 3,
                        radius: 2.height,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.height,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(
                            color: TaskioColors.grey[700].withOpacity(0.4),
                            fontSize: 4.text),
                      ),
                      SizedBox(
                        width: 2.5.width,
                      ),
                      InkWell(
                        onTap: () {
                          model.navigateToLoginView(context);
                        },
                        splashColor: TaskioColors.orange.withOpacity(0.3),
                        child: Text(
                          'Log in',
                          style: TextStyle(
                            color: TaskioColors.orange.withOpacity(0.7),
                            fontSize: 4.text,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
