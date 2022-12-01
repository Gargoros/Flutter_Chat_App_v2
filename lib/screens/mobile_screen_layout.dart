import 'package:flutter/material.dart';

import '../constants/colors_constants.dart';
import '../constants/text_constants.dart';
import '../constants/style_constants.dart';
import '../widgets/contacts_list.dart';

class MobileScreenLayout extends StatelessWidget {
  const MobileScreenLayout({super.key});

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
          onPressed: () {},
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
