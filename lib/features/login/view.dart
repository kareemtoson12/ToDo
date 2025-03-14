import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/routing/app_routes.dart';
import 'package:tasky/core/styles/color_manger.dart';
import 'package:tasky/core/styles/text_styles.dart';
import 'package:tasky/core/widgets/art_widget.dart';

import 'widgets/email_password_texfild.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.0.r),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                artWidget(400),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Login',
                      style: CustomstextStyels.font24black700Wight,
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                EmailPasswordTextField(),
                // SignUp
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Didn’t have any account?',
                      style: CustomstextStyels.font20black700Wight,
                    ),
                    TextButton(
                      child: Text(
                        'Sign Up here',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: ColorsManger.primaryColor, // Text color
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, Routes.signUp);
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
