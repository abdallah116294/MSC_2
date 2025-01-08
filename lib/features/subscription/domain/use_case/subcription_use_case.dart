import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:msc_2/core/error/failures.dart';
import 'package:msc_2/features/subscription/domain/entities/individual_subscribtion_success_entity.dart';
import 'package:msc_2/features/subscription/domain/entities/store_image_entity.dart';
import 'package:msc_2/features/subscription/domain/repositories/subscription_repository.dart';

class SubscriptionUseCase {
  final SubscriptionRepo subscriptionRepo;
  SubscriptionUseCase({required this.subscriptionRepo});
  Future<Either<Failure, IndividualSubscriptionSuccessEntity>>
      individualSubscriptionUseCase(
              String name,
              String age,
           String gender,
              String phone,
              String price,
             
              //XFile image,
              String image_id) async =>
          subscriptionRepo.registerIndividualSubscription(
              name, age,gender, phone, price, image_id,);

  Future<Either<Failure, ImageEntity>> storeImageUseCase(
      XFile image) =>
      subscriptionRepo.storeImage(image);
}
