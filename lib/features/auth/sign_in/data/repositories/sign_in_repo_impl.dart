import 'package:dartz/dartz.dart';
import 'package:msc_2/core/error/failures.dart';
import 'package:msc_2/features/auth/sign_in/data/data_source/sign_in_remote_data_source.dart';
import 'package:msc_2/features/auth/sign_in/domain/entities/sign_in_success_entity.dart';
import 'package:msc_2/features/auth/sign_in/domain/repositories/sign_in_repository.dart';

class SignInRepoImpl implements SignInRepository {
  final SignInRemoteDataSource signInRemoteDataSource;
  SignInRepoImpl({required this.signInRemoteDataSource});
  @override
  Future<Either<Failure, SignInSuccessEntity>> sigInRepo(
      {required String phoneNumber}) async {
    try {
      final response = await signInRemoteDataSource.signIn(phone: phoneNumber);
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
