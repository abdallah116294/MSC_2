import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:msc_2/core/cache/cache_helper.dart';
import 'package:msc_2/core/extensions/context_extensions.dart';
import 'package:msc_2/core/localization/lang_keys.dart';
import 'package:msc_2/core/utils/assets_helper.dart';
import 'package:msc_2/features/app/cubit/app_cubit.dart';

class TopSignInPart extends StatefulWidget {
  const TopSignInPart({
    super.key,
    //required this.onPressed,
   required this.languageButton,
  });
  final Widget languageButton;
  @override
  State<TopSignInPart> createState() => _TopSignInPartState();
}

class _TopSignInPartState extends State<TopSignInPart> {
  bool isArabicSelected = false;
  @override
  void initState() {
    super.initState();
    final langCode = CacheHelper.get(key: "selected_language");
    isArabicSelected = langCode == 'ar';
  }

  @override
  Widget build(BuildContext context) {
    return  
    Stack(
      children: [
        Container(
        height: 400,
          color: const Color(0xFF003D4C),
        ),
        Positioned(
          top: 0.0,
          left: 191,
          child: Image.asset(
            "assets/images/oval_group8.png",
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0).copyWith(top: 40.h),
          child: Column(
            children: [
              widget.languageButton,               
              SizedBox(height: 90.h),
              Image.asset(
                AssetsHelper.mscSignIn,
                width: 356.w,
                height: 130.h,
              ),
            ],
          ),
        ),
      ],
    );
  
  }
}
