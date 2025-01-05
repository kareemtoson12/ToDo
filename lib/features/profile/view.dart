import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:tasky/core/styles/text_styles.dart';
import 'package:tasky/features/profile/widgets/identity_widgets.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(10.0.dg),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //header
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: SvgPicture.asset(
                    'assets/images/svg/arrow_left.svg',
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Text(
                  'Profile',
                  style: CustomstextStyels.font24black700Wight,
                ),
              ],
            ),
            SizedBox(height: 30.h),
            //name
            IdentityWidget(
              subTitle: 'kareemToson',
              title: 'NAME  ',
            ),
            IdentityWidget(
              subTitle: 'kareemToson',
              title: 'NAME  ',
            ),
            IdentityWidget(
              subTitle: 'kareemToson',
              title: 'NAME  ',
            ),
            IdentityWidget(
              subTitle: 'kareemToson',
              title: 'NAME  ',
            ),
            IdentityWidget(
              subTitle: 'kareemToson',
              title: 'NAME  ',
            ),
          ],
        ),
      )),
    );
  }
}
