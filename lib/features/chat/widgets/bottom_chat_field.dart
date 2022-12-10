// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/colors_constants.dart';
import '../../../constants/text_constants.dart';
import '../controller/chat_controller.dart';

class BottomChatField extends ConsumerStatefulWidget {
  final String recieverUserId;
  const BottomChatField({
    Key? key,
    required this.recieverUserId,
  }) : super(key: key);

  @override
  ConsumerState<BottomChatField> createState() => _BottomChatFieldState();
}

class _BottomChatFieldState extends ConsumerState<BottomChatField> {
  bool isShowSendButton = false;
  final TextEditingController _messageController = TextEditingController();

  void sendTextMessage() async {
    if (isShowSendButton) {
      ref.read(chatControllerProvider).sendTextMessage(
            context,
            _messageController.text.trim(),
            widget.recieverUserId,
          );
      setState(() {
        _messageController.text = "";
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _messageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: _messageController,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  setState(() {
                    isShowSendButton = true;
                  });
                } else {
                  isShowSendButton = false;
                }
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: mobileChatBoxColor,
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: SizedBox(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.emoji_emotions,
                            color: appBarIconAndTextColor,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.gif_box,
                            color: appBarIconAndTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: SizedBox(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.camera_alt,
                            color: appBarIconAndTextColor,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.attach_file,
                            color: appBarIconAndTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                hintText: messangeHintText,
                contentPadding: const EdgeInsets.all(10),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    )),
              ),
            ),
          ),
          CircleAvatar(
            backgroundColor: bottomChatButton,
            radius: 25,
            child: GestureDetector(
              onTap: sendTextMessage,
              child: Icon(
                isShowSendButton ? Icons.send : Icons.mic,
                color: textColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
