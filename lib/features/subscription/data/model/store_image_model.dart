import 'package:msc_2/features/subscription/domain/entities/store_image_entity.dart';

// class StoreImageModel extends StoreImageEntity {
//   StoreImageModel(
//       {required super.status,
//       required super.errNum,
//       required super.msg,
//       required super.image});
//   factory StoreImageModel.fromJson(Map<String, dynamic> json) {
//     return StoreImageModel(
//         status: json['status'],
//         errNum: json['errNum'],
//         msg: json['msg'],
//         image: json['image'] != null ? ImageModel.fromJson(json['image']) : null);
//   }
// }

// class ImageModel extends Image {
//   ImageModel({required super.id, required super.image});
//   factory ImageModel.fromJson(Map<String,dynamic>json) {
//     return ImageModel(
//         id: json["id"],
//         image:json["image"] == null
//             ? []
//             : List<String>.from(json["image"]!.map((x) => x))
//         );
//   }
// }
// Import the entity file

class ImageModel extends ImageEntity {
  const ImageModel({
    required bool status,
    required String errNum,
    required String msg,
    required ImageDataModel image,
  }) : super(
          status: status,
          errNum: errNum,
          msg: msg,
          image: image,
        );

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      status: json['status'] as bool,
      errNum: json['errNum'] as String,
      msg: json['msg'] as String,
      image: ImageDataModel.fromJson(json['image']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'errNum': errNum,
      'msg': msg,
      'image': (image as ImageDataModel).toJson(),
    };
  }
}

class ImageDataModel extends ImageDataEntity {
  const ImageDataModel({
    required int id,
    required List<String> images,
  }) : super(
          id: id,
          images: images,
        );

  factory ImageDataModel.fromJson(Map<String, dynamic> json) {
    return ImageDataModel(
      id: json['id'] as int,
      images: List<String>.from(json['image'] as List<dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': images,
    };
  }
}
