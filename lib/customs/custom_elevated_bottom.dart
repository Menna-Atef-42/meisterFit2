import 'package:flutter/material.dart';

class CustomElevatedBottom extends StatelessWidget {
  String? bottomText;
  VoidCallback onPressed;
  Color? textColor;
  Color? backGroundColor;
  Color borderColor;
  bool hasIcon;
  Widget? childIconWidget;
  double? width;
  double? height;

  CustomElevatedBottom({
    super.key,
    this.bottomText,
    this.backGroundColor = Colors.blue,
    this.hasIcon = false,
    this.textColor,
    this.childIconWidget,
    this.borderColor = Colors.transparent,
    required this.onPressed,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: backGroundColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1.5, color: borderColor),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: onPressed,
        child: hasIcon ? childIconWidget : Text(
          bottomText ?? '',
          style: TextStyle(color: textColor ?? Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}


