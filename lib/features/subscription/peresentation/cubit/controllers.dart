import 'package:flutter/material.dart';
import 'package:msc_2/features/subscription/domain/entities/store_image_entity.dart';

class SubSubscriptionController {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final dateController = TextEditingController();
  ImageEntity? imageEntity;
  final wifeOrHusbandAgeController = TextEditingController();
  String keyIdentifier = "individual";

  DateTime date = DateTime(1900);
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
  }
}
  enum Gender{
    male,
    female
  }