import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky/core/routing/app_routes.dart';
import 'package:tasky/core/styles/text_styles.dart';
import 'package:tasky/features/profile/cubit/profile_cubit.dart';
import 'package:tasky/features/profile/widgets/identity_widgets.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
    // Trigger the Cubit's getProfileData method
    context.read<ProfileCubit>().getProfileData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, Routes.home);
                    },
                    child: SvgPicture.asset(
                      'assets/images/svg/arrow_left.svg',
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Text(
                    'Profile',
                    style: CustomstextStyels.font24black700Wight,
                  ),
                ],
              ),
              SizedBox(height: 30.h),

              // Profile Content
              BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  if (state is ProfileLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is ProfileLoaded) {
                    return Column(
                      children: [
                        //user name
                        IdentityWidget(
                          subTitle: state.profile.displayName ?? 'Unknown User',
                          title: 'NAME',
                        ),
                        //phone
                        IdentityWidget(
                          subTitle: state.profile.username ?? '+02',
                          title: 'PHONE',
                        ),
                        //Level
                        IdentityWidget(
                          subTitle: state.profile.level ?? 'Level',
                          title: 'Level',
                        ),
                        //years
                        IdentityWidget(
                          subTitle: '${state.profile.experienceYears} Years',
                          title: 'years',
                        ),
                        //Location
                        IdentityWidget(
                          subTitle: state.profile.address ?? 'maser ',
                          title: 'LOCATION',
                        ),
                      ],
                    );
                  } else if (state is ProfileError) {
                    return Center(
                      child: Text(
                        state.errorMessage,
                        style: TextStyle(color: Colors.red),
                      ),
                    );
                  } else {
                    return const Center(
                      child: Text('Unexpected state.'),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
