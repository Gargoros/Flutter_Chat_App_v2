import 'package:flutter/material.dart';
import 'package:flutter_chat_app/features/auth/screens/otp_screen.dart';
import 'package:flutter_chat_app/features/auth/screens/user_information_screen.dart';
import 'package:flutter_chat_app/features/select_contacts/screens/select_contacts_screen.dart';
import 'package:flutter_chat_app/features/chat/screens/mobile_chat_screen.dart';
import './features/auth/screens/login_screen.dart';

import './common/widgets/error.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(builder: (context) => const LoginScreen());
    case OTPScreen.routeName:
      final verificationId = routeSettings.arguments as String;
      return MaterialPageRoute(
          builder: (context) => OTPScreen(
                verificationId: verificationId,
              ));
    case UserInformationScreen.routeName:
      return MaterialPageRoute(
          builder: (context) => const UserInformationScreen());
    case SelectContactsScreen.routeName:
      return MaterialPageRoute(
          builder: (context) => const SelectContactsScreen());
    case MobileChatScreen.routeName:
      final arguments = routeSettings.arguments as Map<String, dynamic>;
      final name = arguments["name"];
      final uid = arguments["uid"];
      return MaterialPageRoute(
          builder: (context) => MobileChatScreen(
                name: name,
                uid: uid,
              ));
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: ErrorScreen(
            error: "This page doesn't exist",
          ),
        ),
      );
  }
}
