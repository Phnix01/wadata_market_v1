import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [Image.asset("")],
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text("Votre profile"),
      ),
    );
  }
}
