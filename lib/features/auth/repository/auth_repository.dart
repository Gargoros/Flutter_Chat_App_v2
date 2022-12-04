import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/common/repositories/common_firebase_storage_repository.dart';
import 'package:flutter_chat_app/features/auth/screens/user_information_screen.dart';
import 'package:flutter_chat_app/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/utils/utils.dart';
import '../../../screens/mobile_screen_layout.dart';
import '../constants/user_information_const.dart';
import '../screens/otp_screen.dart';

final authRepositoryProvider = Provider(((ref) => AuthRepository(
    auth: FirebaseAuth.instance,
    firebaseFirestore: FirebaseFirestore.instance)));

class AuthRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firebaseFirestore;

  AuthRepository({required this.auth, required this.firebaseFirestore});

  void signInWithPhone(BuildContext context, String phoneNumber) async {
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
          await auth.signInWithCredential(phoneAuthCredential);
        },
        verificationFailed: (e) {
          throw Exception(e.message);
        },
        codeSent: ((String verificationId, int? resendToken) async {
          Navigator.pushNamed(
            context,
            OTPScreen.routeName,
            arguments: verificationId,
          );
        }),
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } on FirebaseAuthException catch (e) {
      showSnackBar(context: context, content: e.message!);
    }
  }

  void verifyOTP({
    required BuildContext context,
    required String verificationId,
    required String userOTP,
  }) async {
    try {
      PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: userOTP);
      await auth.signInWithCredential(phoneAuthCredential);
      Navigator.pushNamedAndRemoveUntil(
        context,
        UserInformationScreen.routeName,
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      showSnackBar(context: context, content: e.message!);
    }
  }

  void saveUserDataToFirebase({
    required String name,
    required File? profilePic,
    required ProviderRef ref,
    required BuildContext context,
  }) async {
    try {
      String uid = auth.currentUser!.uid;
      String photoUrl = circularAvatarBackgroundImage;
      if (profilePic != null) {
        photoUrl = await ref
            .read(commonFirebaseStorageRepositoryProvider)
            .storeFileFirebase(
              "profilePic/$uid",
              profilePic,
            );
      }
      var user = UserModel(
          name: name,
          uid: uid,
          profilePic: photoUrl,
          phoneNumber: auth.currentUser!.uid,
          groupId: [],
          isOnline: true);

      await firebaseFirestore.collection("users").doc(uid).set(user.toMap());
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const MobileScreenLayout(),
          ),
          (route) => false);
    } catch (e) {
      showSnackBar(context: context, content: e.toString());
    }
  }
}
