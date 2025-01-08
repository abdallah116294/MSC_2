import 'package:equatable/equatable.dart';

class SignInSuccessEntity extends Equatable{
  SignInSuccessEntity({
    required this.phoneNumber,
    required this.message,
    required this.otpCode,
  });

  final String? phoneNumber;
  final String? message;
  final String? otpCode;
  
  @override
  // TODO: implement props
  List<Object?> get props => [
    phoneNumber,
    message,
    otpCode
  ];
}
