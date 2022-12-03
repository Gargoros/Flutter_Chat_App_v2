import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/features/landing/screens/landing_screen.dart';
import 'package:flutter_chat_app/firebase_options.dart';
import 'package:flutter_chat_app/router.dart';
import './responsive/responsive_layout.dart';
import './constants/colors_constants.dart';
import './screens/mobile_screen_layout.dart';
import './screens/web_screen_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: backgroundColor,
          appBarTheme: const AppBarTheme(
            color: appBarColor,
          )),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: LandingScreen(),
    );
  }
}
