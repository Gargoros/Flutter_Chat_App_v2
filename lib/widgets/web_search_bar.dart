import 'package:flutter/material.dart';
import '../constants/style_constants.dart';

class WebSearchBar extends StatelessWidget {
  const WebSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      width: MediaQuery.of(context).size.width * 0.25,
      padding: const EdgeInsets.all(10),
      decoration: webSearchBarDecoration,
      child: TextField(
        decoration: webSearchBarStyle,
      ),
    );
  }
}
