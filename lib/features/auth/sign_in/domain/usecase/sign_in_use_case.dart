import 'package:dartz/dartz.dart';
import 'package:msc_2/core/error/failures.dart';
import 'package:msc_2/features/auth/sign_in/domain/repositories/sign_in_repository.dart';

class SignInUseCase {
  SignInRepository signInRepository;
  SignInUseCase({required this.signInRepository});
  Future<Either<Failure, dynamic>> call({required String phone}) =>
      signInRepository.sigInRepo(phoneNumber: phone);
}
