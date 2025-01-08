import 'dart:developer';
import 'dart:io';
// import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:msc_2/core/app_methods/either_extensions.dart';
import 'package:msc_2/core/error/failures.dart';
import 'package:msc_2/features/subscription/domain/entities/individual_subscribtion_success_entity.dart';
import 'package:msc_2/features/subscription/domain/entities/store_image_entity.dart';
import 'package:msc_2/features/subscription/domain/use_case/subcription_use_case.dart';
import 'package:msc_2/features/subscription/peresentation/cubit/controllers.dart';

part 'subscription_state.dart';

class SubscriptionCubit extends Cubit<SubscriptionState> {
  SubscriptionCubit({required this.subscriptionUseCase})
      : super(SubscriptionInitial());
  final SubscriptionUseCase subscriptionUseCase;
  //ImageEntity? imageEntity;
  final controllers = SubSubscriptionController();
  final formKey = GlobalKey<FormState>();
  //void toggleCheckbox() => emit(!state);
  void fimalyinsubscription(String key) {
    emit(ChooseFirstSubscriptionState(type: key));
  }

  void addWifeOrHusband(bool key) {
    emit(AddWifeOrHusbandState(type: key));
  }

  final ImagePicker _picker = ImagePicker();
  XFile? _selectedImage;
  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      _selectedImage = image;
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

  //!Store Image
  Future<void> storeImage(XFile image) async {
    emit(IndividualSubscriptionLoadingState());
    try {
      final response = await subscriptionUseCase.storeImageUseCase(image);
      final rightData = response.asRight();
      if (rightData != null) {
        controllers.imageEntity = rightData;
        log('Right Data form Controllers :${controllers.imageEntity}');
      }
      response.fold((l) {
        log("Error Response${l.errMessage}");
        emit(StoreImageError(msg: l.errMessage));
      }, (r) {
        log("Success Response$r");
        //controllers.imageEntity = r;
        emit(StoreImageSuccess(storeImageEntity: r));
      });
    } catch (e) {
      emit(StoreImageError(msg: e.toString()));
    }
  }

//!Individual Subscription
  Future<void> individualSubscription(String name, String age,String gender,
      String phone, String price, String image_id    ) async {
    emit(IndividualSubscriptionLoadingState());
    try {
      Either<Failure, IndividualSubscriptionSuccessEntity> response =
          await subscriptionUseCase.individualSubscriptionUseCase(
              name, age,gender,phone, price, image_id,);
      final leftdata = response.asLeft();
      log("Error ${leftdata.errMessage}");
      response.fold((l) {
        log("Error Response:${l.errMessage}");
        emit(
            IndividualSubscriptionErrorState(message: l.errMessage.toString()));
      }, (r) {
        emit(IndividualSubscriptionSuccessState(
            individualSubscriptionSuccessEntity: r));
      });
    } catch (e) {
      emit(IndividualSubscriptionErrorState(message: e.toString()));
    }
  }

  //!Male and Female logic
  void selectMale() {
    log('Gender is male');
    emit(SelectMaleGender(gender: Gender.male));
  }

  void selectFemale() {
    log('Gender is female');
    emit(SelectFemaleGender(gender: Gender.female));
  }
}
