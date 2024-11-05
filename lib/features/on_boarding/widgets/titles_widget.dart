import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:msc_2/core/extensions/context_extensions.dart';
import 'package:msc_2/core/utils/app_color.dart';
import 'package:msc_2/core/widgets/custom_text.dart';
import 'package:msc_2/features/app/cubit/app_cubit.dart';

class TitleWidgets extends StatelessWidget {
  const TitleWidgets(
      {super.key, required this.titlekey, required this.descriptionKey});
  final String titlekey, descriptionKey;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //Title Header..
          // TODO: will remove align when add localization
          Align(
            alignment:context.read<AppCubit>().getAlignment(),
            child: CustomText(
              color: AppColor.headerTextOnBoardingColor,
              fontSize: 24.sp,
              text: context.translate(titlekey),
              fontWeight: FontWeight.w400,
              fontFamily: "Jazeel",
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          //Description ..
          Align(
            alignment: context.read<AppCubit>().getAlignment(),
            child: CustomText(
              color: AppColor.descriptionTitleObBoardingColor,
              fontSize: 13.sp,
              maxLines: 4,
              text: context.translate(descriptionKey),
              fontWeight: FontWeight.w700,
              fontFamily: "Cairo",
            ),
          )
        ],
      ),
    );
  }
}
