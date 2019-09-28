import 'package:flutter/material.dart';
import 'package:plants/colors.dart' as AppColors;

class Description extends StatelessWidget {
  final String text;

  Description({this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w600,
        color: AppColors.descriptionTextColor,
        height: 1.4,
      ),
    );
  }
}
