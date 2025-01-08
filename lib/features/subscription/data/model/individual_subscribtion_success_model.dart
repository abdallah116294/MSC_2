// //! Extending IndividualSubscriptionSuccessEntity class
// import 'package:msc_2/features/subscription/domain/entities/individual_subscribtion_success_entity.dart';

// class ExtendedIndividualSubscriptionSuccessEntity extends IndividualSubscriptionSuccessEntity {
//   ExtendedIndividualSubscriptionSuccessEntity({
//     required String? message,
//     required IndividualInsurance? individualInsurance,
//     //! Add any additional fields specific to the subclass here
//   }) : super(
//           message: message,
//           individualInsurance: individualInsurance,
//         );

//   //! Add any custom methods, or override methods if needed
//   @override
//   String toString() {
//     return 'Extended Message: $message, Insurance Name: ${individualInsurance?.nameEn}';
//   }

//   //! You can also create a custom `fromJson` method if the response format is different from the base class
//   factory ExtendedIndividualSubscriptionSuccessEntity.fromJson(Map<String, dynamic> json) {
//     return ExtendedIndividualSubscriptionSuccessEntity(
//       message: json['message'],
//       individualInsurance: json['individual_insurance'] == null
//           ? null
//           : IndividualInsurance.fromJson(json['individual_insurance']),
//     );
//   }
// }

// //! Extending IndividualInsurance class
// class ExtendedIndividualInsurance extends IndividualInsurance {
//   ExtendedIndividualInsurance({
//     required String? nameEn,
//     required String? ageEn,
//     required String? phone,
//     required String? genderAr,
//     required String? genderEn,
//     required String? price,
//     required String? imageId,
//     required DateTime? updatedAt,
//     required DateTime? createdAt,
//     required int? id,
//     //! Add any extra fields here
//   }) : super(
//           nameEn: nameEn,
//           ageEn: ageEn,
//           phone: phone,
//           genderAr: genderAr,
//           genderEn: genderEn,
//           price: price,
//           imageId: imageId,
//           updatedAt: updatedAt,
//           createdAt: createdAt,
//           id: id,
//         );

//   //! You can add custom methods, or override methods if needed
//   @override
//   String toString() {
//     return 'Extended Insurance Name: $nameEn, Price: $price';
//   }

//   //! You can also create a custom `fromJson` method if the response format differs for this subclass
//   factory ExtendedIndividualInsurance.fromJson(Map<String, dynamic> json) {
//     return ExtendedIndividualInsurance(
//       nameEn: json["name_en"],
//       ageEn: json["age_en"],
//       phone: json["phone"],
//       genderAr: json["gender_ar"],
//       genderEn: json["gender_en"],
//       price: json["price"],
//       imageId: json["image_id"],
//       updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
//       createdAt: DateTime.tryParse(json["created_at"] ?? ""),
//       id: json["id"],
//     );
//   }
// }
import 'package:msc_2/features/subscription/data/model/individual_insurance_model.dart';
import 'package:msc_2/features/subscription/domain/entities/individual_subscribtion_success_entity.dart';

class IndividualSubscriptionSuccessModel
    extends IndividualSubscriptionSuccessEntity {
  IndividualSubscriptionSuccessModel(
      {required super.message, required super.individualInsurance});
  factory IndividualSubscriptionSuccessModel.fromJson(
      Map<String, dynamic> json) {
    return IndividualSubscriptionSuccessModel(
        message: json['message'],
        individualInsurance: json['individual_insurance'] != null
            ? IndividualInsuranceModel.fromJson(json['individual_insurance'])
            : null);
  }
}
