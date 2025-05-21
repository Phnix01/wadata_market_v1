import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_shop_v1/models/user_model.dart';

class UserProvider extends ChangeNotifier {
  UserModel? userModel;
  UserModel? get getUserModel {
    return userModel;
  }

  Future<UserModel?> fetchUserInfo() async {
    final auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    if (user == null) {
      return null;
    }
    String uid = user.uid;
    try {
      final userDoc =
          FirebaseFirestore.instance.collection("users").doc(uid).get();
    } on FirebaseException catch (error) {
      rethrow;
    } catch (error) {
      rethrow;
    }
  }
}
