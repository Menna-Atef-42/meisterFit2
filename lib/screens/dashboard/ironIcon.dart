import 'package:flutter/material.dart';
import 'package:fluttercourse/utils/colors.dart';

class Ironicon extends StatelessWidget {
  const Ironicon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(backgroundColor: AppColors.phosphorescentColor, title: const Text('Screen')),
      body: const Center(child: Text('Screen', style: TextStyle(color: Colors.white, fontSize: 24))),
    );
  }
}