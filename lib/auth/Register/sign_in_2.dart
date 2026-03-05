import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttercourse/customs/custom_elevated_bottom.dart';
import 'package:fluttercourse/customs/custom_formField.dart';
import 'package:fluttercourse/utils/colors.dart';
import 'package:fluttercourse/utils/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

class SignIn2 extends StatefulWidget {
  const SignIn2({super.key});

  @override
  State<SignIn2> createState() => _SignIn2State();
}

class _SignIn2State extends State<SignIn2> {


  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool obscurePassword = true;
  GlobalKey<FormState> formKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
      body: Stack(
        children: [


          Image.asset(
            'assets/images/Group 22.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),


          SafeArea(
            child: SingleChildScrollView( // scroll
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: screenHeight * 0.29),

                      Text(
                        'Welcome Back!',
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 40,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.05),
                      Text(
                        'Your Account',
                        style: TextStyle(
                          fontSize: 30,
                          color: AppColors.phosphorescentColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Sign in to Your Account',
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Email
                      CustomFormfield(
                        filled: true,
                        fillColor: AppColors.greyColor,
                        borderSideColor: AppColors.blackColor,
                        controller: emailController,
                        hintText: 'Enter Email',
                        suffixIcon: Icon(Icons.email),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Please enter email';
                          }
                          final bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(text);
                          if (!emailValid) {
                            return 'Please enter valid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      // Password
                      CustomFormfield(
                        filled: true,
                        fillColor: AppColors.greyColor,
                        borderSideColor: AppColors.blackColor,
                        obscureText: obscurePassword,
                        controller: passwordController,
                        hintText: 'Enter Password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            obscurePassword
                                ? Icons.visibility_off
                                : Icons.remove_red_eye,
                          ),
                          onPressed: () {
                            setState(() {
                              obscurePassword = !obscurePassword;
                            });
                          },
                        ),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Please enter password';
                          }
                          if (text.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'Forget my Password',
                                style: TextStyle(
                                    color: AppColors.whiteColor,
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColors.whiteColor),
                              )),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Login button
                      Center(
                        child: CustomElevatedBottom(
                          onPressed: signInWithEmail,
                          width: screenWidth * 0.58,
                          height: screenHeight * 0.07,
                          backGroundColor: AppColors.phosphorescentColor,
                          bottomText: 'Login',
                          textColor: AppColors.blackColor,
                        ),
                      ),

                      const SizedBox(height: 15),

                      // Sign Up redirect
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account ? ",
                            style: TextStyle(color: AppColors.whiteColor),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.popAndPushNamed(
                                    context, AppRoutes.login);
                              },
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                    color: AppColors.phosphorescentColor,
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColors.phosphorescentColor),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  void signInWithEmail() async {
    if (formKey.currentState!.validate()) {

      var url = Uri.parse('https://your-backend-api.com/login');

      try {

        var response = await http.post(
          url,
          body: {
            'email': emailController.text.trim(),
            'password': passwordController.text.trim(),
          },
        );

        if (response.statusCode == 200) {

          var data = jsonDecode(response.body);

          print("Login Success: ${data['token']}");

          AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            title: 'Success',
            desc: 'Login successfully',
            btnOkOnPress: () {
              Navigator.pushNamed(context, AppRoutes.genderScreen);
            },
          ).show();
        } else {
          var errorData = jsonDecode(response.body);

          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            title: 'Login Failed',
            desc: errorData['message'] ?? 'Check your email or password',
            btnOkOnPress: () {},
          ).show();
        }
      } catch (e) {
        print("Network Error: $e");
      }

    }
  }
}