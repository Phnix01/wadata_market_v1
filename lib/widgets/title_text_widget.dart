import 'package:flutter/material.dart';

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget(
      {super.key,
      required this.label,
      this.fontSize = 20,
      this.fontWeight,
      this.maxLines,
      this.color});

  final String label;
  final double fontSize;
  final FontWeight? fontWeight;
  final int? maxLines;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        color: this.color,
        fontSize: this.fontSize,
        fontWeight: FontWeight.bold,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
