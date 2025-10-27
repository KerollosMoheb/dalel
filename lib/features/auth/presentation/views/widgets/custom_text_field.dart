
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.labelText});
  final String labelText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 32),
      child: TextField(
        decoration: InputDecoration(
          border: getBoarderStyle(),
          enabledBorder: getBoarderStyle(),
          focusedBorder: getBoarderStyle(),
          labelText: labelText,
          labelStyle: CustomTextStyles.poppins500style18,
        ),
      ),
    );
  }
}

OutlineInputBorder getBoarderStyle() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: BorderSide(color: AppColors.grey),
  );
}
