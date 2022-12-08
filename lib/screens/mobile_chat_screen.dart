// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_chat_app/constants/colors_constants.dart';
import 'package:flutter_chat_app/widgets/chat_list.dart';

import '../constants/text_constants.dart';
import '../data/dummy_data/info.dart';

class MobileChatScreen extends StatelessWidget {
  static const String routeName = "/mobile-chat";
  const MobileChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: appBarColor,
        title: Text(info[0]["name"].toString()),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.video_call)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: Column(children: [
        const Expanded(child: ChatList()),
        TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: mobileChatBoxColor,
            prefixIcon: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(
                Icons.emoji_emotions,
                color: appBarIconAndTextColor,
              ),
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(
                    Icons.camera_alt,
                    color: appBarIconAndTextColor,
                  ),
                  const Icon(
                    Icons.attach_file,
                    color: appBarIconAndTextColor,
                  ),
                  const Icon(
                    Icons.money,
                    color: appBarIconAndTextColor,
                  ),
                ],
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
        )
      ]),
    );
  }
}
