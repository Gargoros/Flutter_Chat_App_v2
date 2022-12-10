// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/common/utils/utils.dart';

import '../../../models/user_model.dart';

class ChatRepository {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseAuth auth;

  ChatRepository({
    required this.firebaseFirestore,
    required this.auth,
  });

  void _saveDataToContactsSubcollection(
    UserModel senderUserData,
    UserModel reciverUserData,
    String text,
    DateTime timeSent,
    String recieverUserId,
  ) async {}

  void sendTextMessage({
    required BuildContext context,
    required String text,
    required String recieverUserId,
    required UserModel senderUser,
  }) async {
    try {
      var timeSent = DateTime.now();
      UserModel recieverUserData;

      var userDataMap = await firebaseFirestore.collection("users").doc().get();
      recieverUserData = UserModel.fromMap(userDataMap.data()!);

      _saveDataToContactsSubcollection() {}
    } catch (e) {
      showSnackBar(context: context, content: e.toString());
    }
  }
}
