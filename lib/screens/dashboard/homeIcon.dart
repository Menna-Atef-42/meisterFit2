import 'package:flutter/material.dart';
import 'package:fluttercourse/utils/colors.dart';
import 'package:fluttercourse/widgets/workout_item.dart';
import 'package:fluttercourse/screens/dashboard/placeholder_screen.dart';

class Homeicon extends StatelessWidget {
  const Homeicon({super.key});

  static const List<Map<String, dynamic>> workouts = [
    {"image": "assets/images/11.png", "title": "HIIT", "time": "30 min", "calories": "250 kcal"},
    {"image": "assets/images/22.png", "title": "Cardio", "time": "45 min", "calories": "400 kcal"},
    {"image": "assets/images/33.png", "title": "Leg Day", "time": "20 min", "calories": "150 kcal"},
    {"image": "assets/images/44.png", "title": "Stretching", "time": "40 min", "calories": "180 kcal"},
    {"image": "assets/images/55.jpg", "title": "Yoga", "time": "25 min", "calories": "350 kcal"},
    {"image": "assets/images/66.jpg", "title": "Abs", "time": "15 min", "calories": "90 kcal"},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Welcome,', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400, color: AppColors.phosphorescentColor)),
                    Text('John', style: TextStyle(fontSize: 24, color: AppColors.whiteColor)),
                  ],
                ),
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.whiteColor, width: 1),
                    ),
                    child: ClipOval(
                      child: Image.asset('assets/images/gamer.png', fit: BoxFit.cover),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Card(
              color: AppColors.gBColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Your progress', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500, color: AppColors.phosphorescentColor)),
                        const SizedBox(height: 8),
                        Text('70/100 tasks completed this month', style: TextStyle(fontSize: 12, color: AppColors.whiteColor)),
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 70,
                          height: 70,
                          child: CircularProgressIndicator(
                            value: 0.7,
                            strokeWidth: 8,
                            backgroundColor: Colors.white.withOpacity(0.1),
                            valueColor: AlwaysStoppedAnimation<Color>(AppColors.phosphorescentColor),
                          ),
                        ),
                        Text('70%', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.phosphorescentColor)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text('Your Workout Plan', style: TextStyle(color: AppColors.whiteColor, fontSize: 22, fontWeight: FontWeight.w500)),
          ),

          const SizedBox(height: 15),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                itemCount: workouts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => PlaceholderScreen(title: workouts[index]["title"])));
                    },
                    child: WorkoutItem(workout: workouts[index]),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}