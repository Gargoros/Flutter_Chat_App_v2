import 'package:flutter/material.dart';
import '../constants/colors_constants.dart';
import '../constants/style_constants.dart';
import '../data/dummy_data/info.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(bottom: 6.0),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                        NetworkImage(info[index]["profilePic"].toString()),
                    radius: 30,
                  ),
                  title: Text(
                    info[index]["name"].toString(),
                    style: contactTitle,
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(
                      info[index]["message"].toString(),
                      style: contactSubTitle,
                    ),
                  ),
                  trailing: Text(
                    info[index]["time"].toString(),
                    style: contactTrailing,
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(
                color: dividerColor,
              ),
          itemCount: info.length),
    );
  }
}
