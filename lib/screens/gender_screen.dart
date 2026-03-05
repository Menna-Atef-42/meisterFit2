import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttercourse/customs/custom_elevated_bottom.dart';
import 'package:fluttercourse/utils/colors.dart';
import '../utils/routes.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // صورة الخلفية
            Image.asset(
              'assets/images/Group 9.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),


            Positioned(
              bottom: 280,
              left: 20,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Gender',
                    style: TextStyle(
                      color: AppColors.phosphorescentColor,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'to estimate your body’s metabolic rate',
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            Positioned(
              bottom: 150,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  genderOption("Male"),
                  const SizedBox(height: 20),
                  genderOption("Female"),
                ],
              ),
            ),

            Positioned(
              bottom: 60,
              left: 0,
              right: 0,
              child: Center(
                child: CustomElevatedBottom(
                  hasIcon: true,
                  childIconWidget: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Continue' , style: TextStyle(fontSize: 16 ,color: AppColors.blackColor),),

                      Stack(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(50)
                            ),
                          ),
                          Icon(Icons.arrow_forward , color: AppColors.blackColor, size: 20,)
                        ],
                      )
                    ],
                  ),
                  backGroundColor: AppColors.phosphorescentColor,
                  textColor: AppColors.blackColor,
                  bottomText: "Continue",
                  width: 150,
                  height: 43,
                  onPressed: () {
                    if(selectedGender==null) {
                      AwesomeDialog(
                        context: context,
                        animType: AnimType.scale,
                        dialogType: DialogType.noHeader,
                        body: Center(child: Text(
                          'Please select your gender',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),),
                        title: 'This is Ignored',
                        desc: 'This is also Ignored',
                        btnOkOnPress: () {},
                      )
                        ..show();

                    }else{
                      Navigator.pushNamedAndRemoveUntil(
                          context, AppRoutes.homeIcon, (route) => false);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget genderOption(String gender) {
    final bool isSelected = selectedGender == gender;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGender = gender;
        });
      },
      child: Container(
        width: 95,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? AppColors.phosphorescentColor
                : AppColors.gBColor,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // الدائرة الخارجية
            Container(
              width: 18,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? AppColors.phosphorescentColor
                      : AppColors.gOColor,
                  width: 2.5,
                ),
              ),
              child: Center(
                // الدائرة الداخلية
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected
                        ? AppColors.phosphorescentColor
                        : AppColors.gIColor,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              gender,
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}