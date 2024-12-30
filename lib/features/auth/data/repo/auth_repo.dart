import 'package:dartz/dartz.dart';
import 'package:msc_2/core/error/failures.dart';
import 'package:msc_2/core/networking/api_consumer.dart';
import 'package:msc_2/features/auth/data/model/sign_model.dart';
import 'package:msc_2/features/auth/data/model/signin_error.dart';
import 'package:msc_2/features/auth/sign_in/cubit/sign_in_cubit.dart';

abstract class AuthRepo {
  Future<Either<Failure,SignInSuccessModel>>signIn({required String phoneNumber});
}