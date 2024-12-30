import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:msc_2/core/utils/app_color.dart';
import 'package:msc_2/core/widgets/custom_text.dart';
import 'package:msc_2/features/subscription/cubit/check_box_cubit.dart';

class ReusableCheckbox extends StatelessWidget {
  final String label;
  final String keyIdentifier;
  final Function(bool)? onChanged;

  const ReusableCheckbox({
    Key? key,
    required this.label,
    required this.keyIdentifier,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckBoxCubit, Map<String,bool>>(
      builder: (context, state) {
            final checkboxCubit = context.read<CheckBoxCubit>();
              final isChecked = state[keyIdentifier] ?? false;
        return Container(
          width: 156.w,
          height: 44.h,
          decoration: BoxDecoration(
              color: AppColor.grey.withOpacity(.3),
              border: Border.all(
                  color: isChecked == true
                      ? AppColor.checkedColor
                      : AppColor.grey.withOpacity(.3)),
              borderRadius: BorderRadius.all(Radius.circular(12.r))),
          child: Row(
            children: [
              Checkbox(
                activeColor: AppColor.primary,
                shape: const OvalBorder(side: BorderSide(width: 12)),
                value: isChecked,
                onChanged: (value) {
                  if(value!=null){
                    checkboxCubit.toggleCheckbox(keyIdentifier);
                    if (onChanged != null) onChanged!(value);
                  }
                  // checkboxCubit.toggleCheckbox(keyIdentifier);
                  // if (onChanged != null) onChanged!(value??false);
                },
              ),
              SizedBox(
                width: 5.w,
              ),
              CustomText(
                  text: label,
                  fontFamily: "Cairo",
                  color: AppColor.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp)
            ],
          ),
        );
      },
    );
  }
}
