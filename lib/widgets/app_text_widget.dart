import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppNameTextWidget extends StatelessWidget {
  const AppNameTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.purple,
      highlightColor: Colors.red,
      child: Text(
        'Smart Shop',
        style: TextStyle(
          fontSize: 24.0,
          fontFamily: 'Anton',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
