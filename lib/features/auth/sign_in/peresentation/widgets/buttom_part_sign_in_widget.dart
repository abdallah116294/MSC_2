import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:msc_2/config/routes/app_routes.dart';
import 'package:msc_2/core/extensions/context_extensions.dart';
import 'package:msc_2/core/localization/lang_keys.dart';
import 'package:msc_2/core/utils/app_color.dart';
import 'package:msc_2/features/auth/sign_in/peresentation/cubit/sign_in_cubit.dart';
import 'package:msc_2/features/auth/sign_in/peresentation/widgets/line_widget.dart';
import 'package:msc_2/features/auth/sign_in/peresentation/widgets/sign_in_elevated_button_widget.dart';
import 'package:msc_2/features/auth/sign_in/peresentation/widgets/subscribe_button_widget.dart';
import 'package:msc_2/features/auth/sign_in/peresentation/widgets/text_info_widget.dart';

class BottomContainer extends StatelessWidget {
  BottomContainer(
      {super.key,
      required this.signInButton,
      required this.cubit,
      required this.phoneNumberController,
      required this.formKey});
  final TextEditingController phoneNumberController;
  final VoidCallback signInButton;
  final GlobalKey<FormState> formKey;
  final SignInCubit cubit;
  @override
  Widget build(BuildContext context) {
    final remainingHeight = MediaQuery.of(context).size.height - 400;
    return Positioned(
      top: 400,
      left: 0.0,
      right: 0.0,
      bottom: 0.0,
      child: Container(
        height: 400,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(26),
            topRight: Radius.circular(26),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 2),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextInfoWidget(),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: IntlPhoneField(
                      controller: phoneNumberController,
                      decoration: InputDecoration(
                        errorStyle: const TextStyle(color: AppColor.red),
                        hintText:
                            context.translate(LangKeys.enter_phone_number),
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (phone) {
                        if (phone == null || phone.completeNumber.isEmpty) {
                          return 'Please enter your phone number';
                        } else if (phone.completeNumber.length < 10) {
                          return 'Phone number is too short';
                        }
                        return null; //
                      },
                      initialCountryCode: 'JO',
                      dropdownDecoration: BoxDecoration(
                        color: Color(0xff96D0AB),
                        borderRadius: BorderRadius.circular(
                            12.0), // Adjust the radius as needed
                      ),
                      onSubmitted: (phone) {
                        String completePhoneNumber = phone;

                        if (phoneNumberController.text != completePhoneNumber) {
                          phoneNumberController.text = completePhoneNumber;
                        }
                        print('Complete phone number: ${phone}');
                      },
                    ),
                  ),
                  SizedBox(height: 12.h),
                  SignInElevatedButtonWidget(onPressed: () {
                    if (formKey.currentState!.validate()) {
                      cubit.signIN(phoneNumber: phoneNumberController.text);
                      // log("button");
                    }
                  }),
                  SizedBox(height: 12.h),
                  const LineWidget(),
                  SizedBox(height: 12.h),
                  SubscribeButtonWidget(onPressed: () {
                    context.pushName(AppRoutes.subscriptionRoute);
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
