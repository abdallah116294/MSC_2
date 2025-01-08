import 'package:msc_2/features/auth/sign_in/domain/entities/sign_in_success_entity.dart';

class SignInSuccessModel extends SignInSuccessEntity {
  SignInSuccessModel(
      {required super.phoneNumber,
      required super.message,
      required super.otpCode});
  factory SignInSuccessModel.fromJSon(Map<String, dynamic> json) {
    return SignInSuccessModel(
        phoneNumber: json["phone_number"],
        message: json['message'],
        otpCode: json["otp_code"]);
  }
}
