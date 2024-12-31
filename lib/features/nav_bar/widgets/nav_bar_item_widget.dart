import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:msc_2/core/widgets/custom_text.dart';
import 'package:msc_2/core/widgets/svg_icon.dart';

class NavBarItemWidget extends StatelessWidget {
  const NavBarItemWidget({
    super.key, required this.label, required this.iconPath, required this.selectedColor,
  });
  final String label;
  final String iconPath;
  final Color selectedColor;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgIcon(
          icon: iconPath,
          color: selectedColor,
          height: 30.h,
        ),
        CustomText(
          text: label,
          color: selectedColor,
          fontWeight: FontWeight.bold,
          fontSize: 12.sp,
          fontFamily: "Cairo",
        )
      ],
    );
  }
}
