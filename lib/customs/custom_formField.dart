import 'package:flutter/material.dart';
import 'package:fluttercourse/utils/colors.dart';
typedef onValidator = String? Function(String?)?;
class CustomFormfield extends StatelessWidget {
   Color borderSideColor;
   bool? filled ;
   Color? fillColor;
   String? hintText;
   String? labelText;
   TextStyle? hintStyle;
   TextStyle? labelStyle;
   Widget? prefixIcon;
   Widget? suffixIcon;
   onValidator? validator;
   bool obscureText;
   int? maxLines;
   TextInputType? keyboardType;
   TextEditingController? controller;

   CustomFormfield({super.key, this.borderSideColor = Colors.grey,
  this.hintText,
     required this.filled,
  this.labelText,
  this.hintStyle,
  this.labelStyle,
  this.prefixIcon,
    this.validator,
     this.fillColor,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
     this.controller,
     this.maxLines = 1,
  this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines ,
      controller: controller ,
      validator: validator ,
      keyboardType: keyboardType ,
      obscureText: obscureText ,
      decoration: InputDecoration(
        filled:filled ,
        fillColor:fillColor ,
        enabledBorder: buildDecorationBorder(borderSideColor: borderSideColor),
        focusedBorder: buildDecorationBorder(borderSideColor: borderSideColor),
        errorBorder: buildDecorationBorder(borderSideColor: Colors.red),
        focusedErrorBorder: buildDecorationBorder(borderSideColor: Colors.red),
        hintText: hintText,
        labelText: labelText,
        hintStyle:hintStyle ,
        labelStyle: labelStyle,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon
      ),
    );
  }
}

OutlineInputBorder buildDecorationBorder({required Color borderSideColor}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(
      color: borderSideColor,
      width: 1,
    ),
  );
}
