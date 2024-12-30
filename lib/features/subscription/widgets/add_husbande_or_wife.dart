import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:msc_2/core/extensions/context_extensions.dart';
import 'package:msc_2/core/localization/lang_keys.dart';
import 'package:msc_2/core/utils/app_color.dart';
import 'package:msc_2/core/widgets/custom_text.dart';
import 'package:msc_2/features/subscription/cubit/subscription_cubit.dart';
import 'package:msc_2/features/subscription/widgets/spin_box_field.dart';

class AddHusbandOrWifeWidget extends StatefulWidget {
  const AddHusbandOrWifeWidget({
    super.key,
  });

  @override
  State<AddHusbandOrWifeWidget> createState() => _AddHusbandOrWifeWidgetState();
}

class _AddHusbandOrWifeWidgetState extends State<AddHusbandOrWifeWidget> {
  bool isTapped = false;
  @override
  Widget build(BuildContext context) {
    return isTapped
        ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isTapped = false;
                      });
                    },
                    child: Center(
                      child: Container(
                          width: 25.w,
                          height: 25.h,
                          decoration: BoxDecoration(
                            color: AppColor.red,
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.remove,
                              size: 20,
                              color: AppColor.white,
                            ),
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  CustomText(
                      fontFamily: "Cairo",
                      text: context.translate(LangKeys.abolition_wife),
                      color: AppColor.red,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp),   
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomText(
                text: context.translate(LangKeys.age_of_husband_or_wife),
                color: AppColor.black,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                fontFamily: "Cairo",
              ),
              SizedBox(
                height: 10.h,
              ),
              SpinBoxTextField(),
            ],
          )
        : Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isTapped = true;
                  });
                },
                child: Container(
                    width: 25.w,
                    height: 25.h,
                    decoration: BoxDecoration(
                      color: AppColor.primary,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.add,
                        size: 20,
                        color: AppColor.white,
                      ),
                    )),
              ),
              SizedBox(
                width: 12.w,
              ),
              CustomText(
                text: context.translate(LangKeys.add_husband_or_wife),
                color: AppColor.primary,
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                fontFamily: "Cairo",
              )
            ],
          );
  }
}
