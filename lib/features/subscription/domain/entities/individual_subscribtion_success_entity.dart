import 'package:equatable/equatable.dart';

class IndividualSubscriptionSuccessEntity  extends Equatable  {
    IndividualSubscriptionSuccessEntity({
        required this.message,
        required this.individualInsurance,
    });

    final String? message;
    final IndividualInsurance? individualInsurance;
      @override
      // TODO: implement props
      List<Object?> get props => [
        message,
        individualInsurance
      ];

}

class IndividualInsurance  extends Equatable{
    IndividualInsurance({
        required this.nameEn,
        required this.ageEn,
        required this.phone,
        required this.genderAr,
        required this.genderEn,
        required this.price,
        required this.imageId,
        required this.updatedAt,
        required this.createdAt,
        required this.id,
    });

    final String? nameEn;
    final String? ageEn;
    final String? phone;
    final String? genderAr;
    final String? genderEn;
    final String? price;
    final String? imageId;
    final String ? updatedAt;
    final String ? createdAt;
    final int? id;
      @override
      // TODO: implement props
      List<Object?> get props => [
        nameEn,
        ageEn,
        phone,
        genderAr,
        genderEn,
        price,
        imageId,
        updatedAt,
        createdAt,
        id
      ];

}
