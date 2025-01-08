import 'package:equatable/equatable.dart';

class VerifyOtpSuccessEntity extends Equatable {
    VerifyOtpSuccessEntity({
        required this.message,
        required this.token,
    });

    final String? message;
    final String? token;
    
      @override
      // TODO: implement props
      List<Object?> get props => [
        message,
        token
      ];



}
