import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/styles/color_manger.dart';
import 'package:tasky/core/styles/text_styles.dart';
import 'package:tasky/features/login/cubit/login_cubit.dart';

class SigninButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const SigninButton({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginError) {
          // Display error message in a SnackBar
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Please cheack both phone number and password"),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state is LoginSucess) {
          // Handle successful login
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Login successful!'),
              backgroundColor: Colors.green,
            ),
          );
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: GestureDetector(
          onTap: () {
            String phoneNumber = emailController.text.trim();
            final password = passwordController.text.trim();

            // Ensure phone number has +20 prefix
            if (!phoneNumber.startsWith('+20')) {
              phoneNumber = '+20$phoneNumber';
            }

            if (phoneNumber.isNotEmpty && password.isNotEmpty) {
              // Trigger login via Bloc
              BlocProvider.of<LoginCubit>(context).login(phoneNumber, password);
            } else {
              // Handle empty fields
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Please enter both phone number and password"),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          child: Container(
            width: double.infinity,
            height: 50.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorsManger.primaryColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sign In',
                  style: CustomstextStyels.font15White700Wight,
                ),
                SizedBox(
                  width: 15.w,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
