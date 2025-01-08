import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:msc_2/core/error/failures.dart';
import 'package:msc_2/features/subscription/domain/entities/individual_subscribtion_success_entity.dart';
import 'package:msc_2/features/subscription/domain/entities/store_image_entity.dart';

abstract class SubscriptionRepo {
  Future<Either<Failure, IndividualSubscriptionSuccessEntity>>
      registerIndividualSubscription(
        String name,
        String age,
        String gender,
        String phone,
        String price ,
       
       // XFile image,
        String image_id, 
      );
  Future<Either <Failure , ImageEntity>>storeImage(XFile image)    ;
}
