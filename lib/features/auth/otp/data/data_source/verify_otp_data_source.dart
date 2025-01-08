import 'package:dio/dio.dart';
import 'package:msc_2/core/networking/api_constant.dart';
import 'package:msc_2/core/networking/api_consumer.dart';
import 'package:msc_2/features/auth/otp/data/model/veriy_otp_success_model.dart';

abstract class VerifyOtpDataSource {
  Future<VerifyOtpSuccessModel> verifyOtp({
    required String phone,
    required String otp,
  });
}

class VerifyOtpDataSourceImp implements VerifyOtpDataSource {
  final ApiConsumer apiConsumer;
  VerifyOtpDataSourceImp({required this.apiConsumer});
  @override
  Future<VerifyOtpSuccessModel> verifyOtp(
      {required String phone, required String otp}) async {
    final response = await apiConsumer.post(ApiConstants.checkCodeEndPoint,
        body: FormData.fromMap({"phone_number": phone, "otp_code": otp}));
    VerifyOtpSuccessModel verifyOtpSuccessModel =
        VerifyOtpSuccessModel.fromJson(response.data);
    return verifyOtpSuccessModel;
  }
}
