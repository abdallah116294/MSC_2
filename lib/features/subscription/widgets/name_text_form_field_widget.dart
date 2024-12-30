import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:msc_2/core/extensions/context_extensions.dart';
import 'package:msc_2/core/localization/lang_keys.dart';
import 'package:msc_2/core/utils/app_color.dart';
import 'package:msc_2/core/utils/assets_helper.dart';
import 'package:msc_2/core/widgets/svg_icon.dart';
import 'package:msc_2/features/subscription/cubit/subscription_cubit.dart';
import 'package:msc_2/features/subscription/widgets/custom_text_form_field.dart';

class NameTextFormField extends StatelessWidget {
  const NameTextFormField({
    super.key,
    required this.cubit,
  });

  final SubscriptionCubit cubit;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormFiled(
      controller: cubit.controllers.nameController,
      inputFiled: context.translate(LangKeys.enter_full_name),
      isObscureText: false,
      validator: (String? valeue) {
        if (valeue!.isEmpty) {
          return "Please enter email";
        }
        return null;
      },
      suffixIcon: SvgIcon(
        icon: AssetsHelper.uerNameIcon,
        color: AppColor.grey,
        height: 0.024.sh,
      ),
      textInputType: TextInputType.name,
    );
  }
}
