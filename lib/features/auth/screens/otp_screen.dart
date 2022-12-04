import 'package:flutter/material.dart';
import 'package:flutter_chat_app/constants/colors_constants.dart';
import 'package:flutter_chat_app/features/auth/repository/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/otp_screen_const.dart';

class OTPScreen extends ConsumerWidget {
  static const String routeName = "/otp-screen";
  final String verificationId;
  const OTPScreen({super.key, required this.verificationId});

  void verifyOTP(WidgetRef ref, BuildContext context, String userOTP) {
    ref.read(authRepositoryProvider).verifyOTP(
          context: context,
          verificationId: verificationId,
          userOTP: userOTP,
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: const Text(otpScreenTitleText),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),
            const Text(otpScreenSubText),
            SizedBox(
              width: size.width * 0.5,
              child: TextField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: otpScreenTextFieldHintText,
                  hintStyle: otpScreenTextFieldTextStyle,
                ),
                onChanged: (value) {
                  if (value.length == 6) {
                    verifyOTP(ref, context, value.trim());
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
