import 'package:flutter/material.dart';
import 'package:fluttercourse/utils/colors.dart';

class PlaceholderScreen extends StatelessWidget {
  final String title;
  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(backgroundColor: AppColors.phosphorescentColor, title: Text(title)),
      body: Center(
        child: Text(title, style: const TextStyle(color: Colors.white, fontSize: 24), textAlign: TextAlign.center),
      ),
    );
  }
}