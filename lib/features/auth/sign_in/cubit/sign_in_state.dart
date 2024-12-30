part of 'sign_in_cubit.dart';

sealed class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

final class SignInInitial extends SignInState {}
class SignInLoading extends SignInState {}
class SignInSuccess extends SignInState {
  final SignInSuccessModel signInSuccessModel;
  SignInSuccess({required this.signInSuccessModel});
}
class SignInError extends SignInState {
  final String message;
  SignInError({required this.message});
}