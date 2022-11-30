import 'package:flutter/material.dart';
import 'package:flutter_chat_app/widgets/contacts_list.dart';

import '../constants/text_style_constants.dart';

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
          )
        ],
      ),
    );
  }
}
