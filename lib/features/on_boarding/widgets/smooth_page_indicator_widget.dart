import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:msc_2/core/utils/app_color.dart';
import 'package:msc_2/features/on_boarding/cubit/on_boarding_cubit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SmoothIndicatorWidget extends StatelessWidget {
  const SmoothIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<OnBoardingCubit, OnBoardingState>(
            builder: (context, state) {
              return SmoothPageIndicator(
                axisDirection: Axis.horizontal,
                textDirection: TextDirection.rtl,
                onDotClicked: (index) {},
                controller: context
                    .read<OnBoardingCubit>()
                    .pageController, 
                count: context
                    .read<OnBoardingCubit>()
                    .titlesWidget
                    .length, 
                effect: ExpandingDotsEffect(
                   
                  activeDotColor: AppColor.activSmothColor,
                  dotColor: AppColor.grey,
                  dotHeight: 8.0,
                  dotWidth: 14.0.h,
                  spacing: 6.0,
                ), 
              );
            },
          );
  }
}