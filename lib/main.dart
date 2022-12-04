import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_chat_app/firebase_options.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import './common/widgets/error.dart';
import './features/auth/controller/auth_controller.dart';
import './features/landing/screens/landing_screen.dart';
import './router.dart';
import './screens/mobile_screen_layout.dart';
import './constants/colors_constants.dart';
import './common/widgets/loader.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
        appBarTheme: const AppBarTheme(
          color: appBarColor,
        ),
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: ref.watch(userDataAuthProvider).when(
            data: (user) {
              if (user == null) {
                return const LandingScreen();
              }
              return const MobileScreenLayout();
            },
            error: ((error, stackTrace) {
              return ErrorScreen(error: error.toString());
            }),
            loading: (() => const Loader()),
          ),
    );
  }
}
