import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttercourse/utils/colors.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../customs/custom_elevated_bottom.dart';
import '../../customs/custom_formField.dart';
import '../../utils/routes.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> formKey = GlobalKey();
  bool obscurePassword = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.blackColor,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/images/image 20.png',
                  height: screenHeight * 0.25,
                  fit: BoxFit.contain,
                ),

                SizedBox(height: 20),

                Text(
                  'Create an Account',
                  style: TextStyle(
                    color: AppColors.phosphorescentColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 25),

                CustomFormfield(
                  filled: true,
                  fillColor: AppColors.greyColor,
                  controller: nameController,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Please Enter User name';
                    }
                    return null;
                  },
                  borderSideColor: AppColors.blackColor,
                  hintText: 'User name',
                  suffixIcon: Icon(Icons.person, color: AppColors.blackColor),
                ),

                SizedBox(height: 20),

                CustomFormfield(
                  filled: true,
                  fillColor: AppColors.greyColor,
                  controller: emailController,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Please Enter Email';
                    }
                    final bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(text);
                    if (!emailValid) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  borderSideColor: AppColors.blackColor,
                  hintText: 'Enter Email',
                  suffixIcon: Icon(Icons.email, color: AppColors.blackColor),
                ),

                SizedBox(height: 20),

                CustomFormfield(
                  filled: true,
                  fillColor: AppColors.greyColor,
                  obscureText: obscurePassword,
                  controller: passwordController,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Please Enter Password';
                    }
                    if (text.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                  borderSideColor: AppColors.blackColor,
                  hintText: 'Enter Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscurePassword
                          ? Icons.visibility_off
                          : Icons.remove_red_eye,
                      color: AppColors.blackColor,
                    ),
                    onPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                  ),
                ),

                SizedBox(height: 25),

                Center(
                  child: CustomElevatedBottom(
                    onPressed: createAccount,
                    width: screenWidth * 0.58,
                    height: screenHeight * 0.065,
                    backGroundColor: AppColors.phosphorescentColor,
                    bottomText: 'Create an Account',
                    textColor: AppColors.blackColor,
                  ),
                ),

                SizedBox(height: 20),

                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppColors.whiteColor,
                        thickness: 2,
                        indent: 15,
                        endIndent: 15,
                      ),
                    ),
                    Text(
                      'Or',
                      style: TextStyle(color: AppColors.whiteColor),
                    ),
                    Expanded(
                      child: Divider(
                        color: AppColors.whiteColor,
                        thickness: 2,
                        indent: 15,
                        endIndent: 15,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 15),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                      },
                      icon: Icon(Bootstrap.google,
                          size: 30, color: AppColors.phosphorescentColor),
                    ),
                    SizedBox(width: screenWidth * 0.08),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Bootstrap.facebook,
                          size: 30, color: AppColors.phosphorescentColor),
                    ),
                    SizedBox(width: screenWidth * 0.08),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Bootstrap.instagram,
                          size: 30, color: AppColors.phosphorescentColor),
                    ),
                  ],
                ),

                SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an Account? ",
                      style: TextStyle(color: AppColors.whiteColor),
                    ),
                    TextButton(
                      onPressed: () =>
                          Navigator.popAndPushNamed(context, AppRoutes.signIn2),
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                          color: AppColors.phosphorescentColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void createAccount() async {
    if (formKey.currentState!.validate()) {
      try {
        final credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        AwesomeDialog successDialog = AwesomeDialog(
          context: context,
          animType: AnimType.scale,
          dialogType: DialogType.success,
          body: Center(
            child: Text(
              'Account created successfully',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          title: 'This is Ignored',
          desc: 'This is also Ignored',
          btnOkOnPress: () {
            Navigator.pushNamed(context, AppRoutes.genderScreen);
          },
        );
        successDialog.show();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          AwesomeDialog(
            context: context,
            animType: AnimType.scale,
            dialogType: DialogType.info,
            body: Center(child: Text(
              'The password provided is too weak',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),),
            title: 'This is Ignored',
            desc: 'This is also Ignored',
            btnOkOnPress: () {},
          )
            ..show();
        } else if (e.code == 'email-already-in-use') {
          AwesomeDialog(
            context: context,
            animType: AnimType.scale,
            dialogType: DialogType.info,
            body: Center(child: Text(
              'The account already exists for that email.',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),),
            title: 'This is Ignored',
            desc: 'This is also Ignored',
            btnOkOnPress: () {},
          )
            ..show();
        }
      } catch (e) {
        print(e);
      }
    }
  }
}





