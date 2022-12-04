import 'package:flutter/material.dart';
import 'package:flutter_chat_app/common/widgets/custom_button.dart';
import 'package:flutter_chat_app/constants/colors_constants.dart';
import 'package:flutter_chat_app/features/auth/screens/login_screen.dart';

import '../constants/landing_const.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  void navigateToLoginScreen(BuildContext context) {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: size.height * 0.02,
          ),
          const Text(
            landingScreenTitleText,
            style: landingScreenTitleTextStyle,
          ),
          SizedBox(
            height: size.height / 9,
          ),
          Image.asset(
            landingImageLogo,
            height: 340,
            width: 340,
            color: tabColor,
          ),
          SizedBox(
            height: size.height / 9,
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              lanndingScreenSubText,
              style: lanndingScreenSubTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          SizedBox(
              width: size.width * 0.75,
              child: CustomButton(
                  buttonText: landingButtonText,
                  onPressed: () => navigateToLoginScreen(context)))
        ],
      )),
    );
  }
}
