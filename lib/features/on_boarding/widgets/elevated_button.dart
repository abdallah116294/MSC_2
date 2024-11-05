import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:msc_2/core/cache/cache_helper.dart';
import 'package:msc_2/core/extensions/context_extensions.dart';
import 'package:msc_2/core/localization/lang_keys.dart';
import 'package:msc_2/core/utils/app_color.dart';
import 'package:msc_2/core/widgets/custom_elevated.dart';
import 'package:msc_2/features/on_boarding/cubit/on_boarding_cubit.dart';

class ElevatedOnboardingButton extends StatelessWidget {
  const ElevatedOnboardingButton({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      builder: (context, state) {
        final cubit = context.read<OnBoardingCubit>();
        final isLastPage = cubit.currentPage == cubit.titlesWidget.length - 1;
        return Padding(
          padding: const EdgeInsets.only(right: 24, left: 24),
          child: CustomElevated(
            fontSize: 16.sp,
            fontWeight: FontWeight.w800,
            text: isLastPage
                ? context.translate(LangKeys.start)
                : context.translate(LangKeys.next),
            press: () async {
              //check if it the las page
              log('Is Last Page $isLastPage');
              if (isLastPage) {
                CacheHelper.saveIfNotFirstTime();
                log('is Last page');
              } else {
                log('not Last Page ');
                cubit.scrollToNextPage();
              }
            },
            btnColor: AppColor.elevatedColor,
          ),
        );
      },
    );
  }
}
