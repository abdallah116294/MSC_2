import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msc_2/features/auth/sign_in/domain/entities/sign_in_success_entity.dart';
import 'package:msc_2/features/auth/sign_in/domain/usecase/sign_in_use_case.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit({required this.signInUseCase}) : super(SignInInitial());
  //final AuthRepo authRepo;
  final SignInUseCase signInUseCase;
  Future<void> signIN({required String phoneNumber}) async {
    emit(SignInLoading());
    try {
      final response = await signInUseCase.call(phone: phoneNumber);
      response.fold((l) {
        log("Error Response form Cubit:${l.errMessage}");
        emit(SignInError(message: l.errMessage.toString()));
      }, (r) => emit(SignInSuccess(signInSuccessModel: r)));
    } catch (e) {
      emit(SignInError(message: e.toString()));
    }
  }
}
