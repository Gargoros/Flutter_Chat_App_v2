import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/common/widgets/custom_button.dart';
import 'package:flutter_chat_app/constants/colors_constants.dart';
import 'package:flutter_chat_app/features/auth/controller/auth_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/utils/utils.dart';
import '../constants/login_screen_const.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const routeName = "/login-screen";
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final phoneController = TextEditingController();
  Country? country;

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  void pickCountry() {
    showCountryPicker(
        context: context,
        onSelect: (Country _country) {
          setState(() {
            country = _country;
          });
        });
  }

  void sendPhoneNumber() {
    String phoneNumber = phoneController.text.trim();
    if (country != null && phoneNumber.isNotEmpty) {
      ref
          .read(authControllerProvider)
          .singInWithPhone(context, "+${country!.phoneCode}$phoneNumber");
    } else {
      showSnackBar(context: context, content: loginSnackBarText);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(loginScreenTitle),
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(loginScreenSubTitleText),
              SizedBox(
                height: size.height * 0.04,
              ),
              TextButton(
                onPressed: pickCountry,
                child: const Text(loginTextButtonText),
              ),
              SizedBox(
                height: size.height * 0.005,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (country != null) Text("+${country!.phoneCode}"),
                  SizedBox(
                    width: size.width * 0.7,
                    child: TextField(
                      controller: phoneController,
                      decoration: const InputDecoration(
                        hintText: loginHintTextButton,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.2,
              ),
              SizedBox(
                width: size.width * 0.2,
                child: CustomButton(
                  buttonText: loginCustomButtonText,
                  onPressed: sendPhoneNumber,
                ),
              )
            ]),
      ),
    );
  }
}
