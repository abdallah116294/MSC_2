import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:msc_2/features/subscription/cubit/controllers.dart';

part 'subscription_state.dart';

class SubscriptionCubit extends Cubit<SubscriptionState> {
  SubscriptionCubit() : super(SubscriptionInitial());
  final controllers = SubSubscriptionController();
  final formKey = GlobalKey<FormState>();
  //void toggleCheckbox() => emit(!state);
  void fimalyinsubscription(String key) {
    emit(ChooseFirstSubscriptionState(type:key));
  }
  void addWifeOrHusband(bool key) {
    emit(AddWifeOrHusbandState(type: key));
  }
  final ImagePicker _picker = ImagePicker();
  XFile? _selectedImage;
  Future<void>pickImage()async{
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if(image!=null){
      _selectedImage=image;
      emit(ChooseImageState(image: image.path));
    }
  }
   XFile? get selectedImage => _selectedImage;

  List<String> getImagePaths(List<XFile> images) {
    return images.map((image) => image.path).toList();
  }
  Future<DateTime?> selectDate(BuildContext context) async {
    return await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2050),
    );
    
  }
}
