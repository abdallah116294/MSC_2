import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:msc_2/config/routes/app_routes.dart';
import 'package:msc_2/core/utils/app_color.dart';
import 'package:msc_2/core/widgets/custom_text.dart';

showMessage({
  required String message,
  int maxLines = 5,
  required bool isError,
}) {
  ScaffoldMessenger.of(AppRoutes.currentContext).clearSnackBars();
  ScaffoldMessenger.of(AppRoutes.currentContext).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: AppColor.primary,
      elevation: 2.0,
      content: Row(
        children: [
          Container(
            height: 40.h,
            width: 5.w,
            decoration: BoxDecoration(
              color: isError ? AppColor.red : AppColor.primary,
              borderRadius: BorderRadius.circular(3.r),
            ),
          ),
          SizedBox(width: 18.w),
          Expanded(
            child: CustomText(
              text: message,
              color: AppColor.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              maxLines: maxLines,
            ),
          ),
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(AppRoutes.currentContext).clearSnackBars();
            },
            child: Icon(
              Icons.close,
              color: AppColor.black,
            ),
          ),
        ],
      ),
    ),
  );
}