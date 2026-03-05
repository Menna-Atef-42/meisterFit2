import 'package:flutter/material.dart';
import 'package:fluttercourse/customs/custom_elevated_bottom.dart';
import 'package:fluttercourse/utils/colors.dart';

class FrontScreen extends StatefulWidget {
  const FrontScreen({super.key});

  @override
  State<FrontScreen> createState() => _FrontScreenState();
}

class _FrontScreenState extends State<FrontScreen> {
  bool isFront = true;
  String? selectedMuscle;


  //front
  final List<String> frontMuscles = [
    "Shoulder",
    "Triceps",
    "Biceps",
    "Chest",
    "Abs",
    "Neck",
    "Legs",
  ];

  // back
  final List<String> backMuscles = [
    "Calf Muscles",
    "Trapezius",
    "Deltoids",
    "Triceps",
    "Biceps",
    "Hips",
  ];


  final Map<String, String> muscleImages = {
    // Front
    "Shoulder": "assets/images/Shoulder.jpeg",
    "Triceps": "assets/images/image 43.png",
    "Biceps": "assets/images/Biceps2.jpeg",
    "Chest": "assets/images/Chest.jpeg",
    "Abs": "assets/images/Abs.jpeg",
    "Neck": "assets/images/Neck.jpeg",
    "Legs": "assets/images/Legs.jpeg",

    // Back
    "Calf Muscles": "assets/images/Calf Muscle.jpeg",
    "Trapezius": "assets/images/Trapezius.jpeg",
    "Deltoids": "assets/images/Deltoids.jpeg",
    "Triceps": "assets/images/Triceps.jpeg",
    "Biceps": "assets/images/Biceps.jpeg",
    "Hips": "assets/images/Hips.jpeg",
  };


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                "Target Muscles",
                style: TextStyle(
                  color: AppColors.phosphorescentColor,
                  fontSize: 24,
                ),
              ),
              Text(
                "select target muscle group",
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 40),

              /// Front / Back Buttons
              Row(
                children: [
                  GestureDetector(
                    onTap: () => FrontAndBack(true),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isFront
                              ? AppColors.phosphorescentColor
                              : AppColors.transparentColor,
                          width: 2,
                        ),
                      ),
                      child: Text(
                        "Front Side",
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => FrontAndBack(false),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: !isFront
                              ? AppColors.phosphorescentColor
                              : AppColors.transparentColor,
                          width: 2,
                        ),
                      ),
                      child: Text(
                        "Back Side",
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 2,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: isFront
                            ? frontMuscles.length
                            : backMuscles.length,
                        itemBuilder: (context, index) {
                          final muscle = isFront
                              ? frontMuscles[index]
                              : backMuscles[index];
                          final isSelected =
                              selectedMuscle == muscle;

                          return GestureDetector(
                            onTap: () => selectMuscle(muscle),
                            child: Container(
                              margin:
                              const EdgeInsets.symmetric(vertical: 6),
                              width: 160,
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(15),
                                border: Border.all(
                                  color: isSelected
                                      ? AppColors.phosphorescentColor
                                      : Colors.grey,
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 18,
                                    height: 18,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.blackColor,
                                      border: Border.all(
                                        color: isSelected
                                            ? AppColors.phosphorescentColor
                                            : Colors.grey,
                                        width: 1.2,
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.check,
                                      size: 14,
                                      color: isSelected
                                          ? AppColors.phosphorescentColor
                                          : Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    muscle,
                                    style: TextStyle(
                                      color:
                                      AppColors.whiteColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(width: 20),

                    Flexible(
                      flex: 2,
                      child: Center(
                        child: SizedBox(
                          width: 260,
                          height: 450,
                          child: Image.asset(
                            selectedMuscle != null
                                ? muscleImages[selectedMuscle!]!
                                : (isFront
                                ? "assets/images/front.jpeg"
                                : "assets/images/back.jpeg"),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Center(
                child: CustomElevatedBottom(
                  backGroundColor: AppColors.phosphorescentColor,
                  textColor: AppColors.blackColor,
                  bottomText: "Finished",
                  width: 150,
                  height: 43,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void FrontAndBack(bool front) {
    setState(() {
      isFront = front;
      selectedMuscle = null;
    });
  }

  void selectMuscle(String muscle) {
    setState(() {
      selectedMuscle = muscle;
    });
  }
}
