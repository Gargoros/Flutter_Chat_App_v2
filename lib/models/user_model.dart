class UserModel {
  final String name;
  final String uid;
  final String profilePic;
  final String phoneNumber;
  final List<String> groupId;
  final bool isOnline;

  UserModel({
    required this.name,
    required this.uid,
    required this.profilePic,
    required this.phoneNumber,
    required this.groupId,
    required this.isOnline,
  });
}
