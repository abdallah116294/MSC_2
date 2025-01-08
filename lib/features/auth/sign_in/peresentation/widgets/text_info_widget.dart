import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:msc_2/core/extensions/context_extensions.dart';
import 'package:msc_2/core/localization/lang_keys.dart';
import 'package:msc_2/core/utils/app_color.dart';
import 'package:msc_2/core/widgets/custom_text.dart';

class TextInfoWidget extends StatelessWidget {
  const TextInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         SizedBox(height: 12.h),
                  CustomText(
                    text: context.translate(LangKeys.sign_in_welcome),
                    color: AppColor.primary,
                    fontWeight: FontWeight.bold,
                    maxLines: 2,
                    fontSize: 18.sp,
                    fontFamily: "Jazeel",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8.h),
                  CustomText(
                    text: context.translate(LangKeys.sign_in_to_enjoy),
                    color: const Color(0xff726C6C),
                    fontWeight: FontWeight.bold,
                    maxLines: 2,
                    fontSize: 13.sp,
                    fontFamily: "Cairo",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 12.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: CustomText(
                      text: context.translate(LangKeys.phone_number),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Cairo",
                      color: const Color(0xff354349),
                    ),
                  ),

                  SizedBox(height: 8.h),
      ],
    );
  }
}