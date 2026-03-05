import 'package:flutter/material.dart';
import 'package:fluttercourse/utils/colors.dart';

class Hearticon extends StatelessWidget {
  const Hearticon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(backgroundColor: AppColors.phosphorescentColor, title: const Text('welcome')),
      body: const Center(child: Text('welcome', style: TextStyle(color: Colors.white, fontSize: 24))),
    );
  }
}