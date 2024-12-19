import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:tasky/core/styles/color_manger.dart';
import 'package:tasky/core/styles/text_styles.dart';

class SignUpButton extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController passwordController;
  final TextEditingController yearsOfexperinceController;
  final TextEditingController expernceLevelController;
  final TextEditingController addressController;

  const SignUpButton({
    super.key,
    required this.nameController,
    required this.passwordController,
    required this.yearsOfexperinceController,
    required this.expernceLevelController,
    required this.addressController,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
              'Sign Up',
              style: CustomstextStyels.font15White700Wight,
            ),
            SizedBox(
              width: 15.w,
            ),
          ],
        ),
      ),
    );
  }
}
