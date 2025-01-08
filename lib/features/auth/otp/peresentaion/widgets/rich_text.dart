import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRichText extends StatelessWidget {
  final String text;
   final Color textColor;
  final Color numberColor;
  final FontWeight fontWeight;
  final double fontSize;
  final String fontFamily;

  const CustomRichText({
    Key? key,
    required this.text,
    required this.textColor,
    required this.numberColor,
    required this.fontWeight,
    required this.fontSize,
    required this.fontFamily,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
       // Match the number portion from the text
    final numberMatch = RegExp(r'(\+?\d[\d-\s]+)').firstMatch(text);
    final numberText = numberMatch?.group(0) ?? ""; // Extracted number, e.g., "+971-585-557-523"
    final prefixText = numberMatch != null ? text.replaceFirst(numberText, "") : text; // Remaining text, e.g., "رقم "

    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: prefixText,
            style: TextStyle(
              color: textColor, // Apply base color to text
              fontWeight: fontWeight,
              fontSize: fontSize,
              fontFamily: fontFamily,
            ),
          ),
          TextSpan(
            text: numberText,
            style: TextStyle(
              color: numberColor, // Different color for phone number
              fontWeight: fontWeight,
              fontSize: fontSize,
              fontFamily: fontFamily,
            ),
          ),
        ],
      ),
    );
  }
}
