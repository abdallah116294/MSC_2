class SignInErrorModel {
    SignInErrorModel({
        required this.error,
    });

    final Error? error;

    factory SignInErrorModel.fromJson(Map<String, dynamic> json){ 
        return SignInErrorModel(
            error: json["error"] == null ? null : Error.fromJson(json["error"]),
        );
    }

}

class Error {
    Error({
        required this.phoneNumber,
    });

    final List<String> phoneNumber;

    factory Error.fromJson(Map<String, dynamic> json){ 
        return Error(
            phoneNumber: json["phone_number"] == null ? [] : List<String>.from(json["phone_number"]!.map((x) => x)),
        );
    }

}
