import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_chat_app/common/utils/utils.dart';
import 'package:flutter_chat_app/features/auth/controller/auth_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/user_information_const.dart';

class UserInformationScreen extends ConsumerStatefulWidget {
  static const String routeName = "/user-information";
  const UserInformationScreen({super.key});

  @override
  ConsumerState<UserInformationScreen> createState() =>
      _UserInformationScreenState();
}

class _UserInformationScreenState extends ConsumerState<UserInformationScreen> {
  final TextEditingController nameController = TextEditingController();
  File? image;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }

  void selectImage() async {
    image = await pickImageFromGallery(context);
    setState(() {});
  }

  void storeUserData() async {
    String name = nameController.text.trim();

    if (name.isNotEmpty) {
      ref
          .read(authControllerProvider)
          .saveUserDataToFirebase(context, name, image);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(children: [
          Stack(
            children: [
              image == null
                  ? const CircleAvatar(
                      backgroundImage:
                          NetworkImage(circularAvatarBackgroundImage),
                      radius: 80,
                    )
                  : CircleAvatar(
                      backgroundImage: FileImage(image!),
                      radius: 80,
                    ),
              Positioned(
                  bottom: -10,
                  left: 100,
                  child: IconButton(
                      onPressed: selectImage,
                      icon: const Icon(Icons.add_a_photo))),
            ],
          ),
          Row(
            children: [
              Container(
                width: size.width * 0.85,
                padding: const EdgeInsets.all(2),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    hintText: userInfoHintTextName,
                  ),
                ),
              ),
              IconButton(onPressed: storeUserData, icon: const Icon(Icons.done))
            ],
          )
        ]),
      )),
    );
  }
}
