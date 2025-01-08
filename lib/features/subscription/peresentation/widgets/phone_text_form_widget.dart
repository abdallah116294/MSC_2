import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:msc_2/core/extensions/context_extensions.dart';
import 'package:msc_2/core/localization/lang_keys.dart';
import 'package:msc_2/core/utils/app_color.dart';
import 'package:msc_2/features/subscription/peresentation/cubit/subscription_cubit.dart';

class PhoneTextFormWidget extends StatelessWidget {
  const PhoneTextFormWidget({required this.cubit,super.key});
  final SubscriptionCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: IntlPhoneField(
        controller:cubit.controllers.phoneController,
        decoration: InputDecoration(
          errorStyle: const TextStyle(color: AppColor.red),
          hintText: context.translate(LangKeys.enter_phone_number),
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
          borderRadius:
              BorderRadius.circular(12.0), // Adjust the radius as needed
        ),
        onSubmitted: (phone) {
          String completePhoneNumber = phone;

          if (cubit.controllers.phoneController.text != completePhoneNumber) {
            cubit.controllers.phoneController.text = completePhoneNumber;
          }
          print('Complete phone number: ${phone}');
        },
      ),
    );
  }
}
