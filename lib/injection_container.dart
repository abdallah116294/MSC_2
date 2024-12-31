import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:msc_2/core/networking/api_consumer.dart';
import 'package:msc_2/core/networking/dio_manager.dart';
import 'package:msc_2/features/auth/data/repo/auth_repo.dart';
import 'package:msc_2/features/auth/data/repo/auth_repo_impl.dart';
import 'package:msc_2/features/auth/sign_in/cubit/sign_in_cubit.dart';
import 'package:msc_2/features/nav_bar/cubit/nav_bar_cubit.dart';
import 'package:msc_2/features/on_boarding/cubit/on_boarding_cubit.dart';
import 'package:msc_2/features/subscription/cubit/check_box_cubit.dart';
import 'package:msc_2/features/subscription/cubit/subscription_cubit.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final sl = GetIt.instance;
Future<void> init() async {
  //! Subscription
  sl.registerFactory(() => SubscriptionCubit());
  sl.registerFactory(() => CheckBoxCubit());
  //!OnBoarding
  //cubit
  sl.registerFactory(() => OnBoardingCubit());
  //! Auth
  sl.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(apiConsumer: sl()));
  sl.registerFactory(() => SignInCubit(authRepo: sl()));
  //!NavBar
  sl.registerFactory(()=>NavBarCubit());
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
