import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:msc_2/core/error/failures.dart';
import 'package:msc_2/core/networking/api_constant.dart';
import 'package:msc_2/core/networking/api_consumer.dart';
import 'package:msc_2/features/auth/data/model/sign_model.dart';
import 'package:msc_2/features/auth/data/model/signin_error.dart';
import 'package:msc_2/features/auth/data/repo/auth_repo.dart';
import 'package:msc_2/features/auth/sign_in/cubit/sign_in_cubit.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiConsumer apiConsumer;
  AuthRepoImpl({required this.apiConsumer});
  @override
  Future<Either<Failure, SignInSuccessModel>> signIn(
      {required String phoneNumber}) async {
    try {
      final response = await apiConsumer.post(ApiConstants.signInEndPoint,
          body: FormData.fromMap({"phone_number": phoneNumber}));
      if (response.statusCode == 200) {
        SignInSuccessModel signInSuccessModel =
            SignInSuccessModel.fromJson(response.data);
        return Right(signInSuccessModel);
      }
      return Left(ServerFailure.fromDioError(response));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure(e.type.name.toString()));
      }
        return Left(ServerFailure('Something went wrong'));
    }
  }
}
