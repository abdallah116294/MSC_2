import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateOfBirthFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;
  final void Function(DateTime)? onDateSelected;

  const DateOfBirthFormField({
    Key? key,
    required this.controller,
    required this.label,
    this.validator,
    this.onDateSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.calendar_today),
      ),
      validator: validator,
      onTap: () async {
        final DateTime? selectedDate = await showDatePicker(
          context: context,
          initialDate: DateTime(2000, 1, 1),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );

        if (selectedDate != null) {
          controller.text = DateFormat('yyyy-MM-dd').format(selectedDate);
          if (onDateSelected != null) {
            onDateSelected!(selectedDate);
          }
        }
      },
    );
  }
}
