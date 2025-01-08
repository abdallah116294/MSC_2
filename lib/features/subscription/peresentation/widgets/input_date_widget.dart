import 'package:dob_input_field/dob_input_field.dart';
import 'package:flutter/material.dart';

class InputDateWidget extends StatelessWidget {
  const InputDateWidget({required this.label,super.key});
  final String label;
  @override
  Widget build(BuildContext context) {
    return DOBInputField(
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      showLabel: true,
      dateFormatType: DateFormatType.YYYYMMDD,
      autovalidateMode: AutovalidateMode.always,
      fieldLabelText: label,
    );
  }
}
