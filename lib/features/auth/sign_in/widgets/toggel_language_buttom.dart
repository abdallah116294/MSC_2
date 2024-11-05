import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:msc_2/core/extensions/context_extensions.dart';
import 'package:msc_2/core/localization/lang_keys.dart';
import 'package:msc_2/features/app/cubit/app_cubit.dart';

class ToggleLanguageButton extends StatelessWidget {
  const ToggleLanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Align(
        alignment: context.read<AppCubit>().getAlignment(),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0.r),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12),
          ),
          onPressed: () {
            context.read<AppCubit>().toggleLanguage();
            log('language button');
            print('language button');
            //   setState(() {});
          },
          child: Text(
            context.translate(LangKeys.language) == "English" ? "E" : "ع",
            style: const TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}