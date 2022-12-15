import 'package:flutter/material.dart';
import '../constants/colors_constants.dart';
import './text_constants.dart';

const appTitleStyle = TextStyle(
    fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xFF9E9E9E));

const contactTitle = TextStyle(fontSize: 18);
const contactSubTitle = TextStyle(fontSize: 15);
const contactTrailing = TextStyle(
    fontSize: 13, color: Color(0xFF9E9E9E), fontWeight: FontWeight.normal);

const webBackgroundImage = BoxDecoration(
    border: Border(
      left: BorderSide(color: dividerColor),
    ),
    image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage("assets/images/backgroundImage.png")));

const webComtainerDecoration = BoxDecoration(
  border: Border(
    bottom: BorderSide(color: dividerColor),
  ),
  color: chatBarMessage,
);

const webProfileBarDecoration = BoxDecoration(
    color: webAppBarColor,
    border: Border(right: BorderSide(color: dividerColor)));

const webSearchBarDecoration = BoxDecoration(
  border: Border(
    bottom: BorderSide(color: dividerColor),
  ),
);

const hintTextStyle = TextStyle(fontSize: 14);
const messegInfoTextStyle = TextStyle(fontSize: 16);

const messegeDateTextStyle = TextStyle(
  fontSize: 13,
  color: Colors.white60,
);

final webSearchBarStyle = InputDecoration(
    filled: true,
    fillColor: searchBarColor,
    hintText: messageHintText,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: const BorderSide(
        width: 0,
        style: BorderStyle.none,
      ),
    ),
    contentPadding: const EdgeInsets.only(left: 20));

const messageContainerDecoration = BoxDecoration(
    border: Border(
        bottom: BorderSide(
  color: dividerColor,
)));

final messageBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(
      width: 0,
      style: BorderStyle.none,
    ));

final messageTextFieldDecoration = InputDecoration(
    fillColor: searchBarColor,
    filled: true,
    hintText: messageHintText,
    border: messageBorder,
    contentPadding: const EdgeInsets.only(left: 20));
