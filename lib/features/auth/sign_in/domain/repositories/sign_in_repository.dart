import 'package:dartz/dartz.dart';
import 'package:msc_2/core/error/failures.dart';
import 'package:msc_2/features/auth/sign_in/domain/entities/sign_in_success_entity.dart';

abstract class SignInRepository {
  Future<Either<Failure, SignInSuccessEntity>> sigInRepo({required String phoneNumber});
}
