import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:msc_2/core/cache/cache_helper.dart';
import 'package:msc_2/core/extensions/context_extensions.dart';
import 'package:msc_2/core/localization/lang_keys.dart';
import 'package:msc_2/core/utils/app_color.dart';
import 'package:msc_2/core/utils/assets_helper.dart';
import 'package:msc_2/core/widgets/svg_icon.dart';
import 'package:msc_2/features/subscription/peresentation/cubit/subscription_cubit.dart';
import 'package:msc_2/features/subscription/peresentation/widgets/custom_text_form_field.dart';

class SelectDateWidget extends StatelessWidget {
  const SelectDateWidget({
    super.key,
    required this.cubit,
  });

  final SubscriptionCubit cubit;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormFiled(
      controller: cubit.controllers.dateController,
      inputFiled: context.translate(LangKeys.enter_birth_date),
      onTap: () async {
        try {
          FocusScope.of(context).requestFocus(FocusNode());
          DateTime? selectedDate =
              await cubit.selectDate(context); // Allow nullable
          if (selectedDate != null) {
            cubit.controllers.date = selectedDate;
            cubit.controllers.dateController.text =
               DateFormat('MMM dd, yyyy',CacheHelper.get(key: "selected_language")??"en").format(selectedDate);
          } else {
            // Handle case when no date is selected (optional)
            log("No date selected");
          }
        } catch (e) {
          log("Error selecting date: $e");
        }
      },
      isObscureText: false,
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return context.translate(LangKeys.please_enter_your_name);
        }
        return null;
      },
      suffixIcon: SvgIcon(
        icon: AssetsHelper.calenderIcon,
        color: AppColor.grey,
        height: 0.24.h,
      ),
      textInputType: TextInputType.datetime,
    );
  }
}
