import 'package:msc_2/features/auth/otp/domain/entities/verfiy_ot_success_entity.dart';

class VerifyOtpSuccessModel extends VerifyOtpSuccessEntity {
  VerifyOtpSuccessModel({required super.message, required super.token});
  factory VerifyOtpSuccessModel.fromJson(Map<String,dynamic>json){
    return VerifyOtpSuccessModel(
      message:json['message'],
      token: json['token']
    );
  }
}