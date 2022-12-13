import 'package:flutter/material.dart';
import 'package:flutter_chat_app/features/auth/controller/auth_controller.dart';
import 'package:flutter_chat_app/features/select_contacts/screens/select_contacts_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/colors_constants.dart';
import '../constants/text_constants.dart';
import '../constants/style_constants.dart';
import '../features/chat/widgets/contacts_list.dart';

class MobileScreenLayout extends ConsumerStatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  ConsumerState<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends ConsumerState<MobileScreenLayout>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        ref.read(authControllerProvider).setUserState(true);
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        ref.read(authControllerProvider).setUserState(false);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appBarColor,
          centerTitle: false,
          elevation: 0,
          title: const Text(
            appTitle,
            style: appTitleStyle,
          ),
          actions: <Widget>[
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: appBarIconAndTextColor,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert,
                  color: appBarIconAndTextColor,
                ))
          ],
          bottom: const TabBar(
            labelColor: tabColor,
            unselectedLabelColor: appBarIconAndTextColor,
            indicatorColor: tabColor,
            tabs: [
              Tab(
                text: chatTabText,
              ),
              Tab(
                text: statusTabText,
              ),
              Tab(
                text: callsTabText,
              )
            ],
          ),
        ),
        body: const ContactsList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, SelectContactsScreen.routeName);
          },
          backgroundColor: tabColor,
          child: const Icon(
            Icons.comment,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
