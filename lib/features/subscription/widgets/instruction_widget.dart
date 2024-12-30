import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:msc_2/core/extensions/context_extensions.dart';
import 'package:msc_2/core/localization/lang_keys.dart';
import 'package:msc_2/core/utils/app_color.dart';
import 'package:msc_2/core/utils/assets_helper.dart';
import 'package:msc_2/core/widgets/custom_text.dart';
import 'package:msc_2/core/widgets/svg_icon.dart';

class InstructionWidget extends StatelessWidget {
  const InstructionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Container(
          height: 24.h,
          width: 24.w,
          decoration: BoxDecoration(
            color: AppColor.woderdMarkColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),),
           child: SvgIcon(
            height:24.h ,
            color: AppColor.woderdMarkColor,
            icon:AssetsHelper.wondered_mark,
                   ),
         ),
        SizedBox(width:10.w),
        Expanded(
          child: CustomText(
              text: context.translate(LangKeys.instruction),
              color:  AppColor.instructionSubColor,
              fontSize: 15.sp,
              maxLines: 3,
              fontWeight: FontWeight.w500,
              fontFamily: "Cairo",
            ),
        ),
      ],
    );
  }
}