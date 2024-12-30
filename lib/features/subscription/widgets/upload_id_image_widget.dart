import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:msc_2/core/extensions/context_extensions.dart';
import 'package:msc_2/core/localization/lang_keys.dart';
import 'package:msc_2/core/utils/app_color.dart';
import 'package:msc_2/core/utils/assets_helper.dart';
import 'package:msc_2/core/widgets/custom_text.dart';
import 'package:msc_2/core/widgets/svg_icon.dart';
import 'package:msc_2/features/subscription/cubit/subscription_cubit.dart';
import 'package:msc_2/features/subscription/widgets/dotted_widget.dart';

class UploadIDImageWidget extends StatelessWidget {
  const UploadIDImageWidget({
    required this.cubit,
    super.key,
  });
  final SubscriptionCubit cubit;
  //final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        cubit.pickImage();
      },
      child: Center(
        child: Container(
          width: 300,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), // Rounded corners
          ),
          child: cubit.selectedImage != null
              ? Image.file(File(cubit.selectedImage!.path),
                  width: 200, height: 200, fit: BoxFit.fill)
              : Stack(
                  children: [
                    Positioned.fill(
                      child: CustomPaint(
                        painter: DashPainter(),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 200,
                        height: 200,
                        alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgIcon(
                                icon: AssetsHelper.uploadImageIcon2,
                                height: 32.h,
                                color: AppColor.uploadImageTextColor),
                            SizedBox(
                              height: 8.h,
                            ),
                            CustomText(
                                text: context.translate(LangKeys
                                    .upload_a_photo_of_your_personal_ID),
                                color: AppColor.uploadImageTextColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 10.sp),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
