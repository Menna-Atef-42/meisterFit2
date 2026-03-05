import 'package:flutter/material.dart';
import 'package:fluttercourse/utils/colors.dart';

class Profileicone extends StatelessWidget {
  const Profileicone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(backgroundColor: AppColors.phosphorescentColor, title: const Text('Profile Screen')),
      body: const Center(child: Text('Profile Screen', style: TextStyle(color: Colors.white, fontSize: 24))),
    );
  }
}