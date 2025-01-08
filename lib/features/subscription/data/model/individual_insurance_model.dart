import 'package:msc_2/features/subscription/domain/entities/individual_subscribtion_success_entity.dart';

class IndividualInsuranceModel extends IndividualInsurance {
  IndividualInsuranceModel(
      {required super.nameEn,
      required super.ageEn,
      required super.phone,
      required super.genderAr,
      required super.genderEn,
      required super.price,
      required super.imageId,
      required super.updatedAt,
      required super.createdAt,
      required super.id});
  factory IndividualInsuranceModel.fromJson(Map<String, dynamic> json) {
    return IndividualInsuranceModel(
        nameEn: json['name_en'],
        ageEn: json['age_en'],
        phone: json['phone'],
        genderAr: json['gender_ar'],
        genderEn: json['gender_en'],
        price: json['price'],
        imageId: json['image_id'],
        updatedAt:json["updated_at"] ,
        createdAt:json['created_at'] ,
        id: json['id']);
  }
}
