import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_chat_app/common/enums/message_enum.dart';
import 'package:flutter_chat_app/common/providers/message_replied_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '/common/widgets/loader.dart';
import '/features/chat/controller/chat_controller.dart';
import '/models/message_model.dart';

import 'my_message_card.dart';
import 'sender_message_card.dart';

class ChatList extends ConsumerStatefulWidget {
  final String recieverUserId;
  const ChatList({
    Key? key,
    required this.recieverUserId,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatListState();
}

class _ChatListState extends ConsumerState<ChatList> {
  final ScrollController messageController = ScrollController();

  @override
  void dispose() {
    super.dispose();
    messageController.dispose();
  }

  void onMessageSwipe(String message, bool isMe, MessageEnum messageEnum) {
    ref
        .read(messageReplayProvider.notifier)
        .update((state) => MessageReply(message, isMe, messageEnum));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<MessageModel>>(
        stream:
            ref.read(chatControllerProvider).chatStream(widget.recieverUserId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loader();
          }

          SchedulerBinding.instance.addPostFrameCallback((_) {
            messageController
                .jumpTo(messageController.position.maxScrollExtent);
          });
          return ListView.builder(
            controller: messageController,
            itemCount: snapshot.data!.length,
            itemBuilder: ((context, index) {
              final messageData = snapshot.data![index];
              var timeSent = DateFormat.Hm().format(messageData.timeSent);
              if (messageData.senderId ==
                  FirebaseAuth.instance.currentUser!.uid) {
                return MyMessageCard(
                  message: messageData.text,
                  date: timeSent,
                  type: messageData.type,
                  repliedText: messageData.repliedMessage,
                  onLeftSwipe: () => onMessageSwipe(
                    messageData.text,
                    true,
                    messageData.type,
                  ),
                  repliedMessageType: messageData.repliedMessageType,
                  userName: messageData.repliedTo,
                );
              } else {
                return SenderMessageCard(
                  message: messageData.text,
                  date: timeSent,
                  type: messageData.type,
                  onRightSwipe: () =>
                      onMessageSwipe(messageData.text, false, messageData.type),
                  repliedMessageType: messageData.repliedMessageType,
                  repliedText: messageData.repliedMessage,
                  userName: messageData.repliedTo,
                );
              }
            }),
          );
        });
  }
}
