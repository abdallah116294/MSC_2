import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:msc_2/core/utils/app_color.dart';
import 'package:msc_2/core/widgets/custom_elevated.dart';
import 'package:msc_2/core/widgets/custom_text.dart';

class SubscriptionExpirationWidget extends StatelessWidget {
  const SubscriptionExpirationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right:24.0,left: 24.0,top: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: 'تم انتهاء الاشتراك',
            color: AppColor.red,
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
            fontFamily: "Cairo",
          ),
         // ElevatedButton(onPressed: (){}, child: )
          Container(
            height: 32,
            width: 75.w,
            child: CustomElevated(
              text: 'تجديد',
              press: () {},
              btnColor: AppColor.activSmothColor,
              borderRadius: 12,
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              hSize: 32.h,
              textColor: AppColor.white,
              //wSize: 20.w,
            ),
          )
        ],
      ),
    );
  }
}
