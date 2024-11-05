import 'package:get_it/get_it.dart';
import 'package:msc_2/features/on_boarding/cubit/on_boarding_cubit.dart';

final sl = GetIt.instance;
Future<void> init() async {
  //!OnBoarding
  //cubit
  sl.registerFactory(() => OnBoardingCubit());
}
