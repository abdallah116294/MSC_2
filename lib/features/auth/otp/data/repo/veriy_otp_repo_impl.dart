import 'package:dartz/dartz.dart';
import 'package:msc_2/core/error/failures.dart';
import 'package:msc_2/features/auth/otp/data/data_source/verify_otp_data_source.dart';
import 'package:msc_2/features/auth/otp/domain/entities/verfiy_ot_success_entity.dart';
import 'package:msc_2/features/auth/otp/domain/repositories/verify_repo.dart';

class VerifyOtpRepoImpl implements VerifyRepo {
  final VerifyOtpDataSource verifyOtpDataSource;
  VerifyOtpRepoImpl({required this.verifyOtpDataSource});
  @override
  Future<Either<Failure, VerifyOtpSuccessEntity>> verifyOTp(
      {required String phone, required String otp}) async {
    try {
      final response =
          await verifyOtpDataSource.verifyOtp(phone: phone, otp: otp);
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
