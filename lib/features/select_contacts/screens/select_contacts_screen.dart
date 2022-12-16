import 'package:flutter/material.dart';
import 'package:flutter_chat_app/common/widgets/error.dart';
import 'package:flutter_chat_app/common/widgets/loader.dart';
import 'package:flutter_chat_app/constants/colors_constants.dart';
import 'package:flutter_chat_app/features/select_contacts/controller/select_contact_controller.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/select_contacts_const.dart';

class SelectContactsScreen extends ConsumerWidget {
  static const String routeName = "/select-contact";
  const SelectContactsScreen({super.key});

  void selectContact(
      WidgetRef ref, Contact selectedContact, BuildContext context) {
    ref
        .read(selectContactControllerProvider)
        .selectContact(selectedContact, context);
  }

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
      body: ref.watch(getContactsProvider).when(
            data: (contactList) => ListView.builder(
                itemCount: contactList.length,
                itemBuilder: (context, index) {
                  final contact = contactList[index];
                  return InkWell(
                    onTap: (() => selectContact(ref, contact, context)),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: ListTile(
                        title: Text(
                          contact.displayName,
                          style: contactNameStyle,
                        ),
                        //subtitle: Text(contact.phones[0].number),
                        leading: contact.photo == null
                            ? null
                            : CircleAvatar(
                                backgroundImage: MemoryImage(contact.photo!),
                                radius: 30,
                              ),
                      ),
                    ),
                  );
                }),
            error: ((error, stackTrace) =>
                ErrorScreen(error: error.toString())),
            loading: (() => const Loader()),
          ),
    );
  }
}
