import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:msc_2/core/extensions/context_extensions.dart';
import 'package:msc_2/core/localization/lang_keys.dart';
import 'package:msc_2/core/utils/app_color.dart';
import 'package:msc_2/core/widgets/custom_text.dart';

class SignInElevatedButtonWidget extends StatelessWidget {
  const SignInElevatedButtonWidget({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF4CAF50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        onPressed: onPressed,
        child: CustomText(
          text: context.translate(LangKeys.sign_in),
          color: AppColor.white,
          fontWeight: FontWeight.bold,
          fontSize: 16.sp,
        ),
      ),
    );
  }
}