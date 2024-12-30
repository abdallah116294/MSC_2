class SignInSuccessModel {
    SignInSuccessModel({
        required this.phoneNumber,
        required this.message,
        required this.otpCode,
    });

    final String? phoneNumber;
    final String? message;
    final String? otpCode;

    factory SignInSuccessModel.fromJson(Map<String, dynamic> json){ 
        return SignInSuccessModel(
            phoneNumber: json["phone_number"],
            message: json["message"],
            otpCode: json["otp_code"],
        );
    }

}
