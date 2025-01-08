import 'package:dartz/dartz.dart';
import 'package:msc_2/core/error/failures.dart';
import 'package:msc_2/features/auth/otp/domain/entities/verfiy_ot_success_entity.dart';
import 'package:msc_2/features/auth/otp/domain/repositories/verify_repo.dart';

class VerifyOtpUsecase {
  final VerifyRepo verifyRepo;
  VerifyOtpUsecase({required this.verifyRepo});
  Future<Either<Failure, VerifyOtpSuccessEntity>> call(
          {required String phone, required String otp}) =>
      verifyRepo.verifyOTp(phone: phone, otp: otp);
}
