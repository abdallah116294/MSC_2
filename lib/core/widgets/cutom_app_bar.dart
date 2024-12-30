
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:msc_2/core/extensions/context_extensions.dart';
import 'package:msc_2/core/utils/app_color.dart';
import 'package:msc_2/core/widgets/custom_text.dart';
import 'package:msc_2/features/app/cubit/app_cubit.dart';

class CustomAppBarTitle extends StatelessWidget {
  const CustomAppBarTitle({
    super.key,
    required this.title,
    this.color,
    this.withBack = true,
  });

  final String title;
  final Color? color;
  final bool withBack;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50.h, bottom: 30.h),
      child: Row(
        children: [
          withBack
              ? GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: Align(
                    alignment: context.read<AppCubit>().getAlignment(),
                    child: Icon(
                      Icons.arrow_back,
                      size: 30.sp,
                     // height: 30.h,
                      color: color ?? AppColor.white,
                    ),
                  ),
                )
              : const SizedBox(),
         // const Spacer(),
          SizedBox(width: 10.w,),
          CustomText(
            text: title,
            color: color ?? AppColor.white,
            fontSize: 22.sp,
            fontWeight: FontWeight.w700,
          ),
          const Spacer(),
          SizedBox(width: 30.w),
        ],
      ),
    );
  }
}