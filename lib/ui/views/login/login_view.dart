import 'package:provider/provider.dart';
import 'package:taskio/app/colors/taskio_colors.dart';
import 'package:taskio/app/responsiveness/size_config.dart';
import 'package:taskio/app/responsiveness/config_extensions.dart';
import 'package:flutter/material.dart';
import 'package:taskio/ui/views/login/login_viewmodel.dart';
import 'package:taskio/ui/widgets/custom_button.dart';
import 'package:taskio/ui/widgets/input_field.dart';

class LoginView extends StatelessWidget {
  final SizeConfig config = SizeConfig();
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<LoginViewModel>(context);
    SizeConfig.init(context);
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
              key: model.login,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Welcome back to Task.io!',
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
                  SizedBox(
                    height: 2.height,
                  ),
                  InputField(
                    label: 'Email Address',
                    controller: model.email,
                    obscure: false,
                    validate: (String value) {
                      if (value.isEmpty) return 'Field cannot be empty';
                      // else if (model.emailValidator(value.trim()) == false)
                      //   return 'Please provide a valid email address';
                      return null;
                    },
                    capitalization: TextCapitalization.none,
                    action: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
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
                        capitalization: TextCapitalization.none,
                        action: TextInputAction.next,
                        keyboardType: TextInputType.visiblePassword,
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
                    height: 5.height,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 6.height,
                      width: 40.width,
                      margin: EdgeInsets.only(bottom: 1.5.height),
                      child: CustomButton(
                        text: 'Log in',
                        function: () {
                          model.formValidation(context);
                        },
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
                        'Don\'t have an account?',
                        style: TextStyle(
                            color: TaskioColors.grey[700].withOpacity(0.4),
                            fontSize: 4.text),
                      ),
                      SizedBox(
                        width: 2.5.width,
                      ),
                      InkWell(
                        onTap: () {
                          model.navigateToRegisterView(context);
                        },
                        splashColor: TaskioColors.orange.withOpacity(0.3),
                        child: Text(
                          'Register',
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
