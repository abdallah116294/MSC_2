import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:msc_2/core/networking/api_consumer.dart';
import 'package:msc_2/core/networking/dio_manager.dart';
import 'package:msc_2/features/auth/otp/data/data_source/verify_otp_data_source.dart';
import 'package:msc_2/features/auth/otp/data/repo/veriy_otp_repo_impl.dart';
import 'package:msc_2/features/auth/otp/domain/repositories/verify_repo.dart';
import 'package:msc_2/features/auth/otp/domain/usecae/verfiy_otp_usecase.dart';
import 'package:msc_2/features/auth/otp/peresentaion/cubit/verify_otp_cubit.dart';
import 'package:msc_2/features/auth/sign_in/data/data_source/sign_in_remote_data_source.dart';
import 'package:msc_2/features/auth/sign_in/data/repositories/sign_in_repo_impl.dart';
import 'package:msc_2/features/auth/sign_in/domain/repositories/sign_in_repository.dart';
import 'package:msc_2/features/auth/sign_in/domain/usecase/sign_in_use_case.dart';
import 'package:msc_2/features/auth/sign_in/peresentation/cubit/sign_in_cubit.dart';
import 'package:msc_2/features/nav_bar/cubit/nav_bar_cubit.dart';
import 'package:msc_2/features/on_boarding/cubit/on_boarding_cubit.dart';
import 'package:msc_2/features/subscription/data/data_sources/subscription_remote_data_source.dart';
import 'package:msc_2/features/subscription/data/repositories/subscription_repo_impl.dart';
import 'package:msc_2/features/subscription/domain/repositories/subscription_repository.dart';
import 'package:msc_2/features/subscription/domain/use_case/subcription_use_case.dart';
import 'package:msc_2/features/subscription/peresentation/cubit/check_box_cubit.dart';
import 'package:msc_2/features/subscription/peresentation/cubit/subscription_cubit.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final sl = GetIt.instance;
Future<void> init() async {
  //! Subscription
  sl.registerFactory(() => SubscriptionCubit(subscriptionUseCase: sl()));
  sl.registerFactory(() => CheckBoxCubit());
  //!individual subscription
  // uscase
  sl.registerLazySingleton<SubscriptionUseCase>(
      () => SubscriptionUseCase(subscriptionRepo: sl()));
  //repo
  sl.registerLazySingleton<SubscriptionRepo>(
      () => SubscriptionRepoImpl(subscriptionRemoteDataSource: sl()));
  //data source
  sl.registerLazySingleton<SubscriptionRemoteDataSource>(
      () => SubscriptionRemoteDataSourceImpl(apiConsumer: sl()));
  //!OnBoarding
  //cubit
  sl.registerFactory(() => OnBoardingCubit());
  //! Auth
  //!SignIn
  //uscase
  sl.registerLazySingleton<SignInUseCase>(
      () => SignInUseCase(signInRepository: sl()));
  //repo
  sl.registerLazySingleton<SignInRepository>(
      () => SignInRepoImpl(signInRemoteDataSource: sl()));

  ///data Source
  sl.registerLazySingleton<SignInRemoteDataSource>(
      () => SignInRemoteDataSourceImpl(apiConsumer: sl()));
  //!Verify otp
  //usecae
  sl.registerLazySingleton<VerifyOtpUsecase>(
      () => VerifyOtpUsecase(verifyRepo: sl()));
  //repo
  sl.registerLazySingleton<VerifyRepo>(
      () => VerifyOtpRepoImpl(verifyOtpDataSource: sl()));
  //data source
  sl.registerLazySingleton<VerifyOtpDataSource>(
      () => VerifyOtpDataSourceImp(apiConsumer: sl()));
  //cubit
  sl.registerFactory(()=>VerifyOtpCubit(verifyOtpUsecase: sl()));
  sl.registerFactory(() => SignInCubit(signInUseCase: sl()));
  //!NavBar
  sl.registerFactory(() => NavBarCubit());
  //=>Networking
  sl.registerLazySingleton<ApiConsumer>(() => DioManager(dio: sl()));
  sl.registerLazySingleton<DioManager>(() => DioManager(dio: sl()));
  sl.registerLazySingleton(() => PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        request: true,
        responseBody: true,
        responseHeader: true,
        compact: true,
        maxWidth: 120,
      ));
  sl.registerFactory(() => Dio());
}
