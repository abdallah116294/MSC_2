import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:msc_2/core/utils/app_color.dart';
import 'package:msc_2/features/on_boarding/cubit/on_boarding_cubit.dart';
import 'package:msc_2/features/on_boarding/widgets/elevated_button.dart';
import 'package:msc_2/features/on_boarding/widgets/slider_text_widget.dart';
import 'package:msc_2/features/on_boarding/widgets/smooth_page_indicator_widget.dart';
import 'package:msc_2/features/on_boarding/widgets/top_image_widget.dart';
import 'package:msc_2/injection_container.dart'as di;

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColor.gradient1,
    ));
    return BlocProvider(
      create: (context) => di.sl<OnBoardingCubit>(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColor.white,
          body: Column(
            children: [
              //!Top Image
              const TopImageWidget(),
              SizedBox(
                height: 33.h,
              ),
              //!Text For Branding
              const SliderTextWidget(),
              SizedBox(
                height: 30.89.h,
              ),
              const SmoothIndicatorWidget(),
              SizedBox(height: 20.h,),
              const ElevatedOnboardingButton(),
            ],
          ),
        ),
      ),
    );
  }
}
