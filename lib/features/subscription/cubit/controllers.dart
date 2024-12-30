import 'package:flutter/material.dart';

class SubSubscriptionController {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final dateController = TextEditingController();
  final wifeOrHusbandAgeController = TextEditingController();
   String keyIdentifier = "individual";
  DateTime date = DateTime(1900);
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
  }
}
