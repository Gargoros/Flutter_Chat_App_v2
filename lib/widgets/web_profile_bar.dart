import 'package:flutter/material.dart';
import 'package:flutter_chat_app/constants/colors_constants.dart';

import '../constants/text_style_constants.dart';

class WebProfileBar extends StatelessWidget {
  const WebProfileBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.077,
      width: MediaQuery.of(context).size.width * 0.25,
      padding: const EdgeInsets.all(10),
      decoration: webProfileBarDecoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(""),
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.comment,
                    color: appBarIconAndTextColor,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                    color: appBarIconAndTextColor,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
