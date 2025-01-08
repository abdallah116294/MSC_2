import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class AppMethods {
  static Future convertImage(XFile image) async {
    return MultipartFile.fromFile(image.path,
        filename: image.path.split('/').last);
  }
  static     int calculateAge(DateTime birthDate) {
      final DateTime currentDate = DateTime.now();
      int age = currentDate.year - birthDate.year;
      if (currentDate.month < birthDate.month ||
          (currentDate.month == birthDate.month &&
              currentDate.day < birthDate.day)) {
        age--;
      }
      return age;
    }

}
