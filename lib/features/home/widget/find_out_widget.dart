import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:msc_2/core/utils/app_color.dart';
import 'package:msc_2/core/widgets/custom_elevated.dart';
import 'package:msc_2/core/widgets/custom_text.dart';

class FindOutWidget extends StatelessWidget {
  const FindOutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween, 
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                maxLines: 2,
                fontFamily: "Cairo",
                  text: 'اكتشف أقرب المراكز\n الطبية إليك',
                  color: AppColor.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp),
              SizedBox(
                height: 5.h,
              ),
              Container(
                  height: 36.h,
                  width: 128.w,
                  child: CustomElevated(
                      text: 'اكتشف الآن ',
                      borderRadius: 12.r,
                      fontWeight: FontWeight.w700,
                      textColor: AppColor.white,
                      fontSize:14.sp ,
                     // hSize: ,
                      press: () {},
                      btnColor: AppColor.discoverButtonColor))
            ],
          ),
          Image.asset("assets/images/lllustration.png")
        ],
      ),
    );
  }
}
