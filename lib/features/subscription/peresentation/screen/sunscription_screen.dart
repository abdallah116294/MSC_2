import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:msc_2/core/app_methods/app_methods.dart';
import 'package:msc_2/core/extensions/context_extensions.dart';
import 'package:msc_2/core/localization/lang_keys.dart';
import 'package:msc_2/core/utils/app_color.dart';
import 'package:msc_2/core/widgets/custom_text.dart';
import 'package:msc_2/core/widgets/cutom_app_bar.dart';
import 'package:msc_2/features/subscription/peresentation/cubit/check_box_cubit.dart';
import 'package:msc_2/features/subscription/peresentation/cubit/subscription_cubit.dart';
import 'package:msc_2/features/subscription/peresentation/widgets/chose_gender_widget.dart';
import 'package:msc_2/features/subscription/peresentation/widgets/family_insurance_widget.dart';
import 'package:msc_2/features/subscription/peresentation/widgets/individual_subscription_case_button_widget.dart';
import 'package:msc_2/features/subscription/peresentation/widgets/instruction_widget.dart';
import 'package:msc_2/features/subscription/peresentation/widgets/insurance_checkbox_widget.dart';
import 'package:msc_2/features/subscription/peresentation/widgets/name_text_form_field_widget.dart';
import 'package:msc_2/features/subscription/peresentation/widgets/phone_form_field_widget.dart';
import 'package:msc_2/features/subscription/peresentation/widgets/select_date_widget.dart';
import 'package:msc_2/features/subscription/peresentation/widgets/subscription_button_widget.dart';
import 'package:msc_2/features/subscription/peresentation/widgets/upload_id_image_widget.dart';
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

    // Get the current state of the SubscriptionCubit
    final currentState = context.watch<SubscriptionCubit>().state;

    // Access gender based on the current state
    String genderText;
    if (currentState is SelectMaleGender) {
      genderText = "Male";
      log(genderText);
    } else if (currentState is SelectFemaleGender) {
      genderText = "Female";
      log(genderText);
    } else {
      genderText = "Not selected";
      log(genderText);
    }
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
                GenderSelectionWidget(subscriptionCubit: cubit),
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
                BlocConsumer<SubscriptionCubit, SubscriptionState>(
                  listener: (context, state) {
                    if (state is IndividualSubscriptionLoadingState) {
                      log('individual loading');
                    } else if (state is IndividualSubscriptionSuccessState) {
                      log("Success To Individual Subscription+${state.individualSubscriptionSuccessEntity.message}");
                    } else if (state is StoreImageSuccess) {
                      log(state.storeImageEntity.status.toString());
                    } else if (state is StoreImageError) {
                      log("ERROR Upload Image,${state.msg}");
                    } else if (state is IndividualSubscriptionErrorState) {
                      log('ERROR, ${state.message}');
                    }
                  },
                  builder: (context, state) {
                    // Check if image is selected
                    final bool isImageSelected =
                        context.read<SubscriptionCubit>().selectedImage != null;

                    // Check if the current state is StoreImageSuccess
                    if (state is StoreImageSuccess) {
                      //cubit.controllers.imageEntity = state.storeImageEntity;
                    } else if (isImageSelected) {
                      //  final storeImageEntity = state.storeImageEntity;
                      return IndividualSubscriptionCaseButtonWidget(
                          cubit: cubit, genderText: genderText);
                    }
                    if (state is StoreImageLoading) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppColor.primary,
                        ),
                      );
                    } else if (state is IndividualSubscriptionLoadingState) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppColor.primary,
                        ),
                      );
                    } else {
                      return SubscriptionButtonWidget(onPressed: () {
                        if (cubit.controllers.keyIdentifier != null) {
                          log(cubit.controllers.keyIdentifier.toString());
                          log("no Data ");
                        }
                        log("no Data ");
                      });
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

