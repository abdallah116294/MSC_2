import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msc_2/features/auth/data/model/sign_model.dart';
import 'package:msc_2/features/auth/data/repo/auth_repo.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit({required this.authRepo}) : super(SignInInitial());
  final AuthRepo authRepo;
  Future<void> signIN({required String phoneNumber}) async {
    emit(SignInLoading());
    try {
      final response = await authRepo.signIn(phoneNumber: phoneNumber);
      if(response.isLeft()){
        emit(SignInError(message:SignInError(message: response.fold((l) => l.errMessage, (r) => r.toString())).message));
        return;
      }
      response.fold((l) => emit(SignInError(message: l.errMessage)),
          (r) => emit(SignInSuccess(signInSuccessModel: r)));
    } catch (e) {
      emit(SignInError(message:SignInError(message: e.toString()).message));
    }
  }
}
