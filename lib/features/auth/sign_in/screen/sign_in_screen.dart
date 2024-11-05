import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:msc_2/core/cache/cache_helper.dart';
import 'package:msc_2/core/extensions/context_extensions.dart';
import 'package:msc_2/core/localization/lang_keys.dart';
import 'package:msc_2/core/utils/app_color.dart';
import 'package:msc_2/core/widgets/custom_text.dart';
import 'package:msc_2/features/app/cubit/app_cubit.dart';
import 'package:msc_2/features/auth/sign_in/widgets/buttom_part_sign_in_widget.dart';
import 'package:msc_2/features/auth/sign_in/widgets/toggel_language_buttom.dart';
import 'package:msc_2/features/auth/sign_in/widgets/top_part_sign_in_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.signInBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TopSignInPart(languageButton: ToggleLanguageButton(),),
            BottomContainer(
                signInButton: () {}, phoneNumberController: phoneController)
          ],
        ),
      ),
    );
  }
}
