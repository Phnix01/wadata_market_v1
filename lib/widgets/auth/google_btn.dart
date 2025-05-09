import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GoogleBtn extends StatelessWidget {
  const GoogleBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: ElevatedButton.icon(
        onPressed: () {},
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
