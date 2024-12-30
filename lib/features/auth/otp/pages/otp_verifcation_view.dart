import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:msc_2/core/extensions/context_extensions.dart';
import 'package:msc_2/core/utils/app_color.dart';
import 'package:msc_2/core/utils/assets_helper.dart';
import 'package:msc_2/core/widgets/custom_elevated.dart';
import 'package:msc_2/core/widgets/custom_text.dart';
import 'package:msc_2/features/auth/data/model/sign_model.dart';
import 'package:msc_2/features/auth/otp/widgets/pinput.dart';
import 'package:msc_2/features/auth/otp/widgets/rich_text.dart';


class OtpVerificationView extends StatefulWidget {
  const OtpVerificationView({super.key,required this.signInSuccessModel});
  final SignInSuccessModel signInSuccessModel;
  @override
  State<OtpVerificationView> createState() => _OtpVerificationViewState();
}

class _OtpVerificationViewState extends State<OtpVerificationView> {
  final pinputTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColor.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 121.h,
            ),
            Center(child: Image.asset(AssetsHelper.mscSignIn)),
            SizedBox(
              height: 74.h,
            ),
            CustomText(
              text: 'أدخل رمز التحقق',
              color: AppColor.black,
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
              fontFamily: "Cairo",
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomText(
              text: 'لقد ارسلنا لك رمز التأكيد في رسالة نصية علي هاتفك',
              color: AppColor.black.withOpacity(.5),
              fontWeight: FontWeight.bold,
              fontSize: 13.sp,
              fontFamily: "Cairo",
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomRichText(
              text: "رقم ${widget. signInSuccessModel.phoneNumber}",
              numberColor: Colors.blue.shade100,
              textColor: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 13.sp,
              fontFamily: "Cairo",
            ),
            SizedBox(
              height: 25.h,
            ),
            PinPutWidget(controller: pinputTextEditingController),
            SizedBox(
              height: 25.h,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24, left: 24),
              child: CustomElevated(
                  borderRadius: 16.r,
                  text: 'تحقق',
                  press: () {},
                  btnColor: AppColor.primary),
            )
          ],
        ),
      ),
    );
  }
}