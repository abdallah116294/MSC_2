import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:msc_2/core/error/failures.dart';
import 'package:msc_2/features/subscription/data/data_sources/subscription_remote_data_source.dart';
import 'package:msc_2/features/subscription/domain/entities/individual_subscribtion_success_entity.dart';
import 'package:msc_2/features/subscription/domain/entities/store_image_entity.dart';
import 'package:msc_2/features/subscription/domain/repositories/subscription_repository.dart';

class SubscriptionRepoImpl implements SubscriptionRepo {
  final SubscriptionRemoteDataSource subscriptionRemoteDataSource;
  SubscriptionRepoImpl({required this.subscriptionRemoteDataSource});
  @override
  Future<Either<Failure, IndividualSubscriptionSuccessEntity>>
      registerIndividualSubscription(
    String name,
    String age,
    String gender,
    String phone,
    String price,
    String image_id,
  ) async {
    try {
      final response = await subscriptionRemoteDataSource
          .registerIndividualUser(name, age, gender, phone, price, image_id);
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ImageEntity>> storeImage(XFile image) async {
    try {
      final response = await subscriptionRemoteDataSource.storeImage(image);
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
