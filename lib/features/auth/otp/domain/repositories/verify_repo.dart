import 'package:dartz/dartz.dart';
import 'package:msc_2/core/error/failures.dart';
import 'package:msc_2/features/auth/otp/domain/entities/verfiy_ot_success_entity.dart';

abstract class VerifyRepo {
  Future<Either<Failure, VerifyOtpSuccessEntity>> verifyOTp({
    required String phone,
    required String otp,
  });
}
