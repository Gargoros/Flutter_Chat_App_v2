import 'package:flutter/material.dart';
import '../constants/colors_constants.dart';
import '../widgets/chat_list.dart';
import '../widgets/contacts_list.dart';
import '../widgets/web_profile_bar.dart';
import '../constants/style_constants.dart';
import '../widgets/web_chat_app_bar.dart';
import '../widgets/web_search_bar.dart';

class WebScreenLayout extends StatelessWidget {
  const WebScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: const <Widget>[
                      WebProfileBar(),
                      WebSearchBar(),
                      ContactsList(),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            decoration: webBackgroundImage,
            child: Column(
              children: <Widget>[
                const WebChatAppBar(),
                const Expanded(child: ChatList()),
                Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  padding: const EdgeInsets.all(10),
                  decoration: messageContainerDecoration,
                  color: chatBarMessage,
                  child: Row(children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.emoji_emotions_outlined,
                          color: appBarIconAndTextColor,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.attach_file,
                          color: appBarIconAndTextColor,
                        )),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 15,
                        ),
                        child: TextField(
                          decoration: messageTextFieldDecoration,
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.mic,
                          color: appBarIconAndTextColor,
                        )),
                  ]),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
