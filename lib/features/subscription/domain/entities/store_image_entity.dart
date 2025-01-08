import 'package:equatable/equatable.dart';

// class StoreImageEntity extends Equatable {
//     StoreImageEntity({
//         required this.status,
//         required this.errNum,
//         required this.msg,
//         required this.image,
//     });

//     final bool? status;
//     final String? errNum;
//     final String? msg;
//     final Image? image;

//     factory StoreImageEntity.fromJson(Map<String, dynamic> json){ 
//         return StoreImageEntity(
//             status: json["status"],
//             errNum: json["errNum"],
//             msg: json["msg"],
//             image: json["image"] == null ? null : Image.fromJson(json["image"]),
//         );
//     }
    
//       @override
//       // TODO: implement props
//       List<Object?> get props => [
//         status,
//         errNum,
//         msg,
//         image
//       ];

// }

// class Image extends Equatable {
//     Image({
//         required this.id,
//         required this.image,
//     });

//     final int? id;
//     final List<String> image;

//     factory Image.fromJson(Map<String, dynamic> json){ 
//         return Image(
//             id: json["id"],
//             image: json["image"] == null ? [] : List<String>.from(json["image"]!.map((x) => x)),
//         );
//     }
    
//       @override
//       // TODO: implement props
//       List<Object?> get props => [
//         id,
//         image,
//       ];

// }
// import 'package:equatable/equatable.dart';

class ImageEntity extends Equatable {
  final bool status;
  final String errNum;
  final String msg;
  final ImageDataEntity image;

  const ImageEntity({
    required this.status,
    required this.errNum,
    required this.msg,
    required this.image,
  });

  @override
  List<Object?> get props => [status, errNum, msg, image];
}

class ImageDataEntity extends Equatable {
  final int id;
  final List<String> images;

  const ImageDataEntity({
    required this.id,
    required this.images,
  });

  @override
  List<Object?> get props => [id, images];
}
