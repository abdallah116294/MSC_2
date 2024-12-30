import 'dart:developer';
import 'dart:io';
// import 'dart:nativewrappers/_internal/vm/lib/math_patch.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:msc_2/core/cache/cache_helper.dart';
import 'package:msc_2/core/extensions/context_extensions.dart';
import 'package:msc_2/core/localization/lang_keys.dart';
import 'package:msc_2/core/utils/app_color.dart';
import 'package:msc_2/core/utils/assets_helper.dart';
import 'package:msc_2/core/widgets/custom_text.dart';
import 'package:msc_2/core/widgets/custom_text_form_field.dart';
import 'package:msc_2/core/widgets/cutom_app_bar.dart';
import 'package:msc_2/core/widgets/svg_icon.dart';
import 'package:msc_2/features/subscription/cubit/check_box_cubit.dart';
import 'package:msc_2/features/subscription/cubit/subscription_cubit.dart';
import 'package:msc_2/features/subscription/widgets/custom_text_form_field.dart';
import 'package:msc_2/features/subscription/widgets/dotted_widget.dart';
import 'package:msc_2/features/subscription/widgets/family_insurance_widget.dart';
import 'package:msc_2/features/subscription/widgets/instruction_widget.dart';
import 'package:msc_2/features/subscription/widgets/insurance_checkbox_widget.dart';
import 'package:msc_2/features/subscription/widgets/name_text_form_field_widget.dart';
import 'package:msc_2/features/subscription/widgets/phone_form_field_widget.dart';
import 'package:msc_2/features/subscription/widgets/reusable_checkbox_widget.dart';
import 'package:msc_2/features/subscription/widgets/select_date_widget.dart';
import 'package:msc_2/features/subscription/widgets/subscription_button_widget.dart';
import 'package:msc_2/features/subscription/widgets/upload_id_image_widget.dart';
import 'package:msc_2/injection_container.dart' as di;

class SubscriptionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<CheckBoxCubit>(),
        ),
        BlocProvider(
          create: (context) => di.sl<SubscriptionCubit>(),
        ),
      ],
      child: const _SubscriptionBody(),
    );
  }
}

class _SubscriptionBody extends StatelessWidget {
  const _SubscriptionBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<SubscriptionCubit>(context);
    // final String keyIdentifier = "individual";
    return Scaffold(
      body: Form(
        key: cubit.formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //!Appbar
                CustomAppBarTitle(
                  title: context.translate(LangKeys.subscription),
                  color: AppColor.black,
                ),
                SizedBox(
                  height: 20.h,
                ),
                //!Instruction Text
                const InstructionWidget(),
                SizedBox(
                  height: 14.h,
                ),
                CustomText(
                  text: context.translate(LangKeys.invented_type_of_insurance),
                  color: AppColor.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  fontFamily: "Cairo",
                ),
                //!CheckBoxes of Subscription
                SizedBox(
                  height: 14.h,
                ),
                InsuranceCheckBoxWidget(cubit: cubit),
                //! User Information Form
                SizedBox(
                  height: 24.h,
                ),
                CustomText(
                    text: context.translate(LangKeys.name),
                    color: AppColor.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp),
                SizedBox(
                  height: 10.h,
                ),
                //!Name Text Field
                NameTextFormField(cubit: cubit),
                SizedBox(
                  height: 24.h,
                ),
                CustomText(
                    text: context.translate(LangKeys.birth_data),
                    color: AppColor.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp),
                SizedBox(
                  height: 24.h,
                ),
                //!Date Text Field
                SelectDateWidget(cubit: cubit),
                //!Phone number
                SizedBox(
                  height: 24.h,
                ),
                CustomText(
                  text: context.translate(LangKeys.phone_number),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Cairo",
                  color: const Color(0xff354349),
                ),
                SizedBox(
                  height: 12.h,
                ),
                PhoneFormFieldWidget(cubit: cubit),
                FamilyInsuranceWidget(),

                SizedBox(
                  height: 24.h,
                ),
                //! Image Upload Section
                BlocBuilder<SubscriptionCubit, SubscriptionState>(
                  builder: (context, state) {
                    return UploadIDImageWidget(
                      cubit: cubit,
                    );
                  },
                ),
                //!Submit Button
                SizedBox(
                  height: 36.h,
                ),
                SubscriptionButtonWidget(
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
