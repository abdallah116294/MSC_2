import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:msc_2/core/utils/app_color.dart';
import 'package:msc_2/core/utils/assets_helper.dart';
import 'package:msc_2/core/widgets/custom_text.dart';
import 'package:msc_2/core/widgets/svg_icon.dart';
import 'package:msc_2/features/home/widget/circle_image.dart';

class WelcomeUserWidget extends StatelessWidget {
  const WelcomeUserWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40,right: 24,left: 24),
      child: Row(
        children: [
          CircleImageWidget(image:"assets/images/abdallah2.jpg" ,size: 48,),
          SizedBox(width: 12.w,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            CustomText(text:"مرحباً 🎉", color: AppColor.grey, fontWeight: FontWeight.w500, fontSize: 12.sp,fontFamily: "Cairo",),
            SizedBox(height: 5.h,),
            CustomText(text: 'عبدالله محمد ', color: AppColor.black, fontWeight: FontWeight.w600, fontSize: 14.sp,fontFamily: "Cairo",)
          ],
          ),
          SizedBox(width:130.w ,),
          Container(
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(
             color: AppColor.white ,
             borderRadius: BorderRadius.circular(18.r),
             border: Border.all(
              color: AppColor.grey,
             )
            ),
            child: Center(
              child:SvgIcon(icon: AssetsHelper.notifcationIcon, color:AppColor.notifcationColor,height: 30.h, ),
            ),
          )
        ],
      ),
    );
  }
}

