import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/styles/color_manger.dart';
import 'package:tasky/core/styles/text_styles.dart';
import 'package:tasky/features/signin/cubit/sign_in_cubit.dart';

class SignUpButton extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController passwordController;
  final TextEditingController yearsOfExperienceController;
  final TextEditingController experienceLevelController;
  final TextEditingController addressController;

  const SignUpButton({
    super.key,
    required this.nameController,
    required this.passwordController,
    required this.yearsOfExperienceController,
    required this.experienceLevelController,
    required this.addressController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInLoading) {
          // Show a loading indicator
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Signing in...')),
          );
        } else if (state is SignInSuccess) {
          // Handle success, navigate to another page
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Welcome, ${state.response.displayName}!')),
          );
        } else if (state is SignInFailure) {
          // Show error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('error')),
          );
        }
      },
      child: GestureDetector(
        onTap: () {
          // Trigger the signIn function in SignInCubit
          final signInCubit = context.read<SignInCubit>();

          signInCubit.signIn(
            nameController.text,
            passwordController.text,
            nameController.text, // Assuming displayName is the same as name
            experienceLevelController.text,
            addressController.text,
            int.tryParse(yearsOfExperienceController.text) ?? 0,
          );
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
                'Sign Up',
                style: CustomstextStyels.font15White700Wight,
              ),
              SizedBox(
                width: 15.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
