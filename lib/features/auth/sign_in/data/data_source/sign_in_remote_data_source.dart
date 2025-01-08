import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:msc_2/core/error/failures.dart';
import 'package:msc_2/core/networking/api_constant.dart';
import 'package:msc_2/core/networking/api_consumer.dart';
import 'package:msc_2/features/auth/sign_in/data/model/sign_in_success_model.dart';

abstract class SignInRemoteDataSource {
  Future<SignInSuccessModel> signIn({required String phone});
}

class SignInRemoteDataSourceImpl implements SignInRemoteDataSource {
  final ApiConsumer apiConsumer;
  SignInRemoteDataSourceImpl({required this.apiConsumer});
  @override
  Future<SignInSuccessModel> signIn({required String phone}) async {
    final response = await apiConsumer.post(ApiConstants.signInEndPoint,
        body: FormData.fromMap({"phone_number": phone}));
    if (response.statusCode == 200) {
      SignInSuccessModel signInSuccessModel =
          SignInSuccessModel.fromJSon(response.data);
      return signInSuccessModel;
    } else {
      final errorMessage = response.data['error'];
      log("Error Response:$response");
      throw errorMessage;
    }
  }
}
