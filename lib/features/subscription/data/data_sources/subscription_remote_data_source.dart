import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:msc_2/core/app_methods/app_methods.dart';
import 'package:msc_2/core/networking/api_constant.dart';
import 'package:msc_2/core/networking/api_consumer.dart';
import 'package:msc_2/features/subscription/data/model/individual_subscribtion_success_model.dart';
import 'package:msc_2/features/subscription/data/model/store_image_model.dart';

abstract class SubscriptionRemoteDataSource {
  Future<IndividualSubscriptionSuccessModel> registerIndividualUser(
    String name,
    String age,
    String gender,
    String phone,
    String price,
    // XFile image,
    String image_id,
  );
  Future<ImageModel> storeImage(XFile image);
}

class SubscriptionRemoteDataSourceImpl implements SubscriptionRemoteDataSource {
  final ApiConsumer apiConsumer;
  SubscriptionRemoteDataSourceImpl({required this.apiConsumer});
  @override
  Future<IndividualSubscriptionSuccessModel> registerIndividualUser(
      String name,
      String age,
             String gender,
      String phone,
      String price,
      String image_id) async {
    final response =
        await apiConsumer.post(ApiConstants.individualSubscriptionEndPoint,
            body: FormData.fromMap({
              "name_en": name,
              "age_en": age,
              "age_ar":age,
              "gender_ar":gender,
              "gender_en": gender,
              "phone": phone,
              "price": price,
              //  "image_links": image!=null?AppMethods.convertImage(image):null,
              "image_id": image_id
            }));
    log("Response ${response.data}");
    IndividualSubscriptionSuccessModel
        extendedIndividualSubscriptionSuccessEntity =
        IndividualSubscriptionSuccessModel.fromJson(response.data);
    return extendedIndividualSubscriptionSuccessEntity;
  }

  @override
  Future<ImageModel> storeImage(XFile image) async {
    final response = await apiConsumer.post(ApiConstants.storeImageEndPoint,
        body: FormData.fromMap({
          "image[]":
              image != null ? await AppMethods.convertImage(image) : null,
        }));
    // log(""response.data);
    ImageModel storeImageModel = ImageModel.fromJson(response.data);
    return storeImageModel;
  }
}
