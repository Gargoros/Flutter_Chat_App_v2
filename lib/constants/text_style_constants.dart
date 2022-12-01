import 'package:flutter/material.dart';
import 'package:flutter_chat_app/constants/colors_constants.dart';
import 'text_constants.dart';

const appTitleStyle = TextStyle(
    fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xFF9E9E9E));

const contactTitle = TextStyle(fontSize: 18);
const contactSubTitle = TextStyle(fontSize: 15);
const contactTrailing = TextStyle(fontSize: 13, color: Color(0xFF9E9E9E));

const webBackgroundImage = BoxDecoration(
    image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage("assets/images/backgroundImage.png")));

const webProfileBarDecoration = BoxDecoration(
    color: webAppBarColor,
    border: Border(right: BorderSide(color: dividerColor)));

const webSearchBarDecoration = BoxDecoration(
  border: Border(
    bottom: BorderSide(color: dividerColor),
  ),
);

const hintTextStyle = TextStyle(fontSize: 14);

final webSearchBarStyle = InputDecoration(
    hintText: searchHintTextField,
    hintStyle: hintTextStyle,
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          width: 0,
          style: BorderStyle.none,
        )),
    filled: true,
    fillColor: searchBarColor,
    prefixIcon: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Icon(
          Icons.search,
          size: 20,
        )),
    contentPadding: const EdgeInsets.all(10));
