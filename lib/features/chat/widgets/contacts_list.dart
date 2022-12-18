import 'package:flutter/material.dart';
import 'package:flutter_chat_app/features/chat/controller/chat_controller.dart';
import 'package:flutter_chat_app/models/chat_contact_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../common/widgets/loader.dart';
import '../screens/mobile_chat_screen.dart';
import '../../../constants/colors_constants.dart';
import '../../../constants/style_constants.dart';

class ContactsList extends ConsumerWidget {
  const ContactsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: StreamBuilder<List<ChatContact>>(
          stream: ref.watch(chatControllerProvider).chatContacts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Loader();
            }
            return ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var chatContactData = snapshot.data![index];

                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, MobileChatScreen.routeName,
                          arguments: {
                            "name": chatContactData.name,
                            "uid": chatContactData.contactId,
                          });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 6.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(chatContactData.profilePic),
                          radius: 30,
                        ),
                        title: Text(
                          chatContactData.name,
                          style: contactTitle,
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Text(
                            chatContactData.lastMessage,
                            style: contactSubTitle,
                          ),
                        ),
                        trailing: Text(
                          DateFormat.Hm().format(chatContactData.timeSent),
                          style: contactTrailing,
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(
                      color: dividerColor,
                    ),
                itemCount: snapshot.data!.length);
          }),
    );
  }
}
