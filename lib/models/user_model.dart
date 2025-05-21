import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String userId;
  final String userName;
  final String userImage;
  final String userEmail;
  final Timestamp createdAt;
  final List userCart, userWish;
  const UserModel({
    required this.userId,
    required this.userName,
    required this.userImage,
    required this.userEmail,
    required this.userCart,
    required this.userWish,
    required this.createdAt,
  });
}
