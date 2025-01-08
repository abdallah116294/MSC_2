import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msc_2/features/auth/otp/domain/entities/verfiy_ot_success_entity.dart';
import 'package:msc_2/features/auth/otp/domain/usecae/verfiy_otp_usecase.dart';

part 'verify_otp_state.dart';

class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  VerifyOtpCubit({required this.verifyOtpUsecase}) : super(VerifyOtpInitial());
  final VerifyOtpUsecase verifyOtpUsecase;
  Future<void> verfiyOtp({
    required String phone,
    required String otp,
  }) async {
    emit(VerifyOtpLoading());
    try {
      final response = await verifyOtpUsecase.call(phone: phone, otp: otp);
      response.fold((l) {
        emit(VerifyOtpError(error: l.errMessage.toString()));
      }, (r) {
        emit(VerifyOtpSuccess(verifyOtpSuccessEntity: r));
      });
    } catch (e) {
      emit(VerifyOtpError(error: e.toString()));
    }
  }
}
