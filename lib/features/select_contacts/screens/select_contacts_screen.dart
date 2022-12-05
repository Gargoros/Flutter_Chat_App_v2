import 'package:flutter/material.dart';
import 'package:flutter_chat_app/constants/colors_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/select_contacts_const.dart';

class SelectContactsScreen extends ConsumerWidget {
  static const String routeName = "/select-contact";
  const SelectContactsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(contactsAppBarText),
        backgroundColor: appBarColor,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),
    );
  }
}