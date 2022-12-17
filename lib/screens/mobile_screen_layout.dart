import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_chat_app/common/utils/utils.dart';
import 'package:flutter_chat_app/features/auth/controller/auth_controller.dart';
import 'package:flutter_chat_app/features/select_contacts/screens/select_contacts_screen.dart';
import 'package:flutter_chat_app/features/stories/screens/confirm_status_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/colors_constants.dart';
import '../constants/text_constants.dart';
import '../constants/style_constants.dart';
import '../features/chat/widgets/contacts_list.dart';
import '../features/stories/screens/status_contacts_screen.dart';

class MobileScreenLayout extends ConsumerStatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  ConsumerState<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends ConsumerState<MobileScreenLayout>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  late TabController tabBarController;
  @override
  void initState() {
    super.initState();
    tabBarController = TabController(length: 3, vsync: this);
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
          bottom: TabBar(
            controller: tabBarController,
            labelColor: tabColor,
            unselectedLabelColor: appBarIconAndTextColor,
            indicatorColor: tabColor,
            tabs: const [
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
        body: TabBarView(controller: tabBarController, children: const [
          ContactsList(),
          StatusContactsScreen(),
          Text("Calls"),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            if (tabBarController.index == 0) {
              Navigator.pushNamed(context, SelectContactsScreen.routeName);
            } else {
              File? pickedImage = await pickImageFromGallery(context);
              if (pickedImage != null) {
                Navigator.pushNamed(context, ConfirmStatusScreen.routeName,
                    arguments: pickedImage);
              }
            }
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
