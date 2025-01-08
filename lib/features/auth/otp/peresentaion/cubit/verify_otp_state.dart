part of 'verify_otp_cubit.dart';

sealed class VerifyOtpState extends Equatable {
  const VerifyOtpState();

  @override
  List<Object> get props => [];
}

final class VerifyOtpInitial extends VerifyOtpState {}

class VerifyOtpLoading extends VerifyOtpState {}

class VerifyOtpSuccess extends VerifyOtpState {
  final VerifyOtpSuccessEntity verifyOtpSuccessEntity;
  VerifyOtpSuccess({required this.verifyOtpSuccessEntity});
}

class VerifyOtpError extends VerifyOtpState {
  final String error;
  VerifyOtpError({required this.error});
}
