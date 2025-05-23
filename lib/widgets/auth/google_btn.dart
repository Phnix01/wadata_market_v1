import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:smart_shop_v1/root_screen.dart';
import 'package:smart_shop_v1/services/my_app_functions.dart';

class GoogleBtn extends StatelessWidget {
  const GoogleBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Future<void> _googleSignSignIn({required BuildContext context}) async {
      final googleSignIn = GoogleSignIn();
      final googleAccount = await googleSignIn.signIn();
      try {
        if (googleAccount != null) {
          final googleAuth = await googleAccount.authentication;
          if (googleAuth.accessToken != null && googleAuth.idToken != null) {
            final authResults = await FirebaseAuth.instance
                .signInWithCredential(GoogleAuthProvider.credential(
              accessToken: googleAuth.accessToken,
              idToken: googleAuth.idToken,
            ));
            if (authResults.additionalUserInfo!.isNewUser) {
              await FirebaseFirestore.instance
                  .collection("users")
                  .doc(
                    authResults.user!.uid,
                  )
                  .set({
                'userId': authResults.user!.uid,
                'userName': authResults.user!.displayName,
                'userImage': authResults.user!.photoURL,
                'userEmail': authResults.user!.email,
                'createdAt': Timestamp.now(),
                'userWish': [],
                'userCart': [],
              });
            }
          }
        }
      } on FirebaseException catch (error) {
        await MyAppFunctions.showErrorOrWarningDialog(
            context: context, subtitle: error.toString(), fct: () {});
      } catch (error) {
        await MyAppFunctions.showErrorOrWarningDialog(
            context: context, subtitle: error.toString(), fct: () {});
      }
    }

    return SizedBox(
      width: 150,
      child: ElevatedButton.icon(
        onPressed: () async {
          await _googleSignSignIn(context: context);
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          elevation: 5,
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
        ),
        label: Text("Google"),
        icon: FaIcon(
          FontAwesomeIcons.google,
          color: Colors.red,
        ),
      ),
    );
  }
}
