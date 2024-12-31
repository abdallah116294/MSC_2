import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:msc_2/core/utils/app_color.dart';
import 'package:msc_2/core/widgets/custom_elevated.dart';
import 'package:msc_2/core/widgets/custom_text.dart';
import 'package:msc_2/core/widgets/cutom_app_bar.dart';
import 'package:msc_2/features/subscription/widgets/custom_text_form_field.dart';

class AskOtherCard extends StatelessWidget {
  const AskOtherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: AskOtherCardBody(),
    );
  }
}

class AskOtherCardBody extends StatelessWidget {
  AskOtherCardBody({super.key});
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CustomAppBarTitle(
              title: '',
              color: AppColor.black,
            ),
            Image.asset(
              "assets/images/card_image.png",
              height: 300.h,
              fit: BoxFit.fill,
            ),
            CustomText(
              text: 'طلب بطاقة أخرى',
              color: AppColor.checkedColor,
              fontWeight: FontWeight.w700,
              fontSize: 24,
              fontFamily: "Cairo",
            ),
            SizedBox(
              height: 40.h,
            ),
            CustomTextFormFiled(
              controller: nameController,
              textInputType: TextInputType.name,
              maxline: 1,
              onTap: () {},
              inputFiled: "اكتب اسمك",
            ),
            SizedBox(
              height: 12.h,
            ),
            CustomTextFormFiled(
                controller: nameController,
                textInputType: TextInputType.name,
                maxline: 9,
                onTap: () {},
                inputFiled: "سبب الطلب"),
            SizedBox(
              height: 12.h,
            ),
            Container(
              height: 56.h,
              width: 327,
              child: CustomElevated(
                text: 'إرسال',
                press: () {},
                btnColor: AppColor.checkedColor,
                borderRadius: 12,
                textColor: AppColor.white,
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
              ),
            )
          ],
        ),
      ),
    );
  }
}
