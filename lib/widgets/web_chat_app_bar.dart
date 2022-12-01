import 'package:flutter/material.dart';
import '../constants/colors_constants.dart';
import '../constants/style_constants.dart';
import '../data/dummy_data/info.dart';

class WebChatAppBar extends StatelessWidget {
  const WebChatAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.077,
      width: MediaQuery.of(context).size.width * 0.75,
      padding: const EdgeInsets.all(10),
      color: webAppBarColor,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: NetworkImage(""),
                  radius: 30,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.01,
                ),
                Text(
                  info[0]["name"].toString(),
                  style: contactTitle,
                )
              ],
            ),
            Row(
              children: <Widget>[
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
                    )),
              ],
            )
          ]),
    );
  }
}
