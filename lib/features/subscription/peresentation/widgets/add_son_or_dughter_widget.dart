import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:msc_2/core/extensions/context_extensions.dart';
import 'package:msc_2/core/localization/lang_keys.dart';
import 'package:msc_2/core/utils/app_color.dart';
import 'package:msc_2/core/widgets/custom_text.dart';

class AddSonOrDaughterWidget extends StatelessWidget {
  const AddSonOrDaughterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
              width: 25.w,
              height: 25.h,
              decoration: BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.circular(2),
              ),
              child: const Center(
                child: Icon(
                  Icons.add,
                  size: 20,
                  color: AppColor.white,
                ),
              )),
        ),
        SizedBox(
          width: 12.w,
        ),
        CustomText(
          text: context.translate(LangKeys.add_son_or_daughter),
          color: AppColor.primary,
          fontWeight: FontWeight.w500,
          fontSize: 16.sp,
          fontFamily: "Cairo",
        )
      ],
    );
  }
}

