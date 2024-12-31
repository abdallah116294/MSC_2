import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:msc_2/config/routes/app_routes.dart';
import 'package:msc_2/core/extensions/context_extensions.dart';
import 'package:msc_2/core/utils/app_color.dart';
import 'package:msc_2/core/utils/assets_helper.dart';
import 'package:msc_2/core/utils/text_styles.dart';
import 'package:msc_2/core/widgets/custom_elevated.dart';
import 'package:msc_2/core/widgets/custom_text.dart';
import 'package:msc_2/core/widgets/svg_icon.dart';
import 'package:msc_2/features/home/widget/circle_image.dart';
import 'package:msc_2/features/home/widget/custom_card.dart';
import 'package:msc_2/features/home/widget/find_out_widget.dart';
import 'package:msc_2/features/home/widget/left_curved_paint.dart';
import 'package:msc_2/features/home/widget/right_custom_paint.dart';
import 'package:msc_2/features/home/widget/subscription_expiration_widget.dart';
import 'package:msc_2/features/home/widget/substract2_paint_widget.dart';
import 'package:msc_2/features/home/widget/substract_paint_widget.dart';
import 'package:msc_2/features/home/widget/welcome_user_widget.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomScreenBody();
  }
}

class HomScreenBody extends StatelessWidget {
  const HomScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // SizedBox(
        //   height: 8.h,
        // ),
        const WelcomeUserWidget(),
        // SizedBox(
        //   height: 24.h,
        // ),
        const SubscriptionExpirationWidget(),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset("assets/images/banner.png"),
        ),
        const FindOutWidget(),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: 'بطاقتك',
                color: AppColor.black,
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                fontFamily: "Cairo",
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        context.pushName(AppRoutes.askOtherCard);
                      },
                      icon: const Icon(
                        Icons.add,
                        color: AppColor.checkedColor,
                        size: 14,
                      )),
                  CustomText(
                    text: 'طلب بطاقة أخرى',
                    color: AppColor.checkedColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    fontFamily: "Cairo",
                  )
                ],
              )
            ],
          ),
        ),
        // SizedBox(
        //   height: .h,
        // ),
        const CardWidget()
      ],
    );
  }
}
