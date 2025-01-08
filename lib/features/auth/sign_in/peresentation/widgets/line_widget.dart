import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:msc_2/core/extensions/context_extensions.dart';
import 'package:msc_2/core/localization/lang_keys.dart';
import 'package:msc_2/core/widgets/custom_text.dart';


class LineWidget extends StatelessWidget {
  const LineWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
          margin: const EdgeInsets.only(
              left: 10, right:20),
          child: const Divider(
            color: Color(0xffE5F3EA),
            height: 36,
            thickness: 2,
          ),
        )),
        CustomText(
       text: context.translate(LangKeys.dont_have_insurance),
       fontSize: 12.sp,
       fontWeight: FontWeight.w700,
       fontFamily: "Cairo",
       color: Color(0xff433F3E),
        ),
        Expanded(
            child: Container(
          margin: const EdgeInsets.only(
              left:20, right: 10),
          child: Divider(
            color: Color(0xffE5F3EA),
            height: 36.h,
            thickness: 2,
          ),
        ))
      ],
    );
  }
}