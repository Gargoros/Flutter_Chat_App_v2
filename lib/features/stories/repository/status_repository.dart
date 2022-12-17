import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/common/repositories/common_firebase_storage_repository.dart';
import 'package:flutter_chat_app/common/utils/utils.dart';
import 'package:flutter_chat_app/models/status_model.dart';
import 'package:flutter_chat_app/models/user_model.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

class StatusRepository {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseAuth auth;
  final ProviderRef ref;
  StatusRepository({
    required this.firebaseFirestore,
    required this.auth,
    required this.ref,
  });

  void uploadStatus({
    required String userName,
    required String profilePic,
    required String phoneNumber,
    required File statusImage,
    required BuildContext context,
  }) async {
    try {
      var statusId = const Uuid().v1();
      String uid = auth.currentUser!.uid;
      String imageUrl = await ref
          .read(commonFirebaseStorageRepositoryProvider)
          .storeFileFirebase("/status/$statusId$uid", statusImage);
      List<Contact> contacts = [];
      if (await FlutterContacts.requestPermission()) {
        contacts = await FlutterContacts.getContacts(withProperties: true);
      }
      List<String> uidWhoCanSee = [];
      for (int i = 0; i < contacts.length; i++) {
        var userDataFireBase = await firebaseFirestore
            .collection("users")
            .where(
              "phoneNumber",
              isEqualTo: contacts[i]
                  .phones[0]
                  .number
                  .replaceAll(" ", "")
                  .replaceAll("-", "")
                  .replaceAll("(", "")
                  .replaceAll(")", ""),
            )
            .get();
        if (userDataFireBase.docs.isNotEmpty) {
          var userData = UserModel.fromMap(userDataFireBase.docs[0].data());
          uidWhoCanSee.add(userData.uid);
        }
      }
      List<String> statusImageUrls = [];
      var statusSnapshot = await firebaseFirestore
          .collection("status")
          .where("uid", isEqualTo: auth.currentUser!.uid)
          .where("createdAt",
              isLessThan: DateTime.now().subtract(const Duration(hours: 24)))
          .get();
      if (statusSnapshot.docs.isNotEmpty) {
        StatusModel status = StatusModel.fromMap(statusSnapshot.docs[0].data());
        statusImageUrls = status.photoUrl;
        statusImageUrls.add(imageUrl);
        await firebaseFirestore
            .collection("status")
            .doc(statusSnapshot.docs[0].id)
            .update({"photoUrl": statusImageUrls});
        return;
      } else {
        statusImageUrls = [imageUrl];
      }

      StatusModel status = StatusModel(
          uid: uid,
          userName: userName,
          phoneNumber: phoneNumber,
          photoUrl: statusImageUrls,
          createdAt: DateTime.now(),
          profilePic: profilePic,
          statusId: statusId,
          whoCanSee: uidWhoCanSee);

      await firebaseFirestore
          .collection("status")
          .doc(statusId)
          .set(status.toMap());
    } catch (e) {
      showSnackBar(context: context, content: (e).toString());
    }
  }
}
