import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:msc_2/features/on_boarding/cubit/on_boarding_cubit.dart';

class SliderTextWidget extends StatelessWidget {
  const SliderTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
            builder: (context, state) {
              return Container(
                height: 140.h,
                width: 327.w,
                child: PageView(
                  controller: context.read<OnBoardingCubit>().pageController,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index) {
                    context.read<OnBoardingCubit>().updateCurrentPage(index);
                  },
                  children: List.generate(
                      context.read<OnBoardingCubit>().titlesWidget.length,
                      (index) =>
                          context.read<OnBoardingCubit>().titlesWidget[index]),
                ),
              );
            },
          );
  }
}