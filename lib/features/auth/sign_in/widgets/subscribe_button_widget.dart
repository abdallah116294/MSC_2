import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:msc_2/core/extensions/context_extensions.dart';
import 'package:msc_2/core/localization/lang_keys.dart';
import 'package:msc_2/core/utils/app_color.dart';
import 'package:msc_2/core/widgets/custom_text.dart';

class SubscribeButtonWidget extends StatelessWidget {
  const SubscribeButtonWidget({super.key,required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: Size(327.w, 52.h),
            backgroundColor: AppColor.white,
            side: BorderSide(color: AppColor.primary)),
        onPressed: onPressed,
        child: CustomText(
            text: context.translate(LangKeys.join_now),
            color: const Color(0xff4BA86E),
            fontWeight: FontWeight.w700,
            fontSize: 16.sp));
  }
}
