import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fluttercourse/screens/dashboard/homeIcon.dart';
import 'package:fluttercourse/screens/dashboard/heartIcon.dart';
import 'package:fluttercourse/screens/dashboard/ironIcon.dart';
import 'package:fluttercourse/screens/dashboard/profileIcone.dart';
import 'package:fluttercourse/utils/colors.dart';

class DashboardMain extends StatefulWidget {
  const DashboardMain({super.key});

  @override
  State<DashboardMain> createState() => _DashboardMainState();
}

class _DashboardMainState extends State<DashboardMain> {
  int selectedIndex = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: IndexedStack(
        index: selectedIndex,
        children: const [
          Homeicon(),
          Hearticon(),
          Ironicon(),
          Profileicone(),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: selectedIndex,
        height: 60,
        items: const [
          ImageIcon(AssetImage('assets/images/home.png'), size: 25),
          ImageIcon(AssetImage('assets/images/heart.png'), size: 35),
          ImageIcon(AssetImage('assets/images/iron.png'), size: 35),
          ImageIcon(AssetImage('assets/images/profile.png'), size: 35),
        ],
        color: AppColors.phosphorescentColor,
        buttonBackgroundColor: AppColors.whiteColor,
        backgroundColor: AppColors.blackColor,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}