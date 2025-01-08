part of 'subscription_cubit.dart';

@immutable
sealed class SubscriptionState {}

final class SubscriptionInitial extends SubscriptionState {}

final class ChooseFirstSubscriptionState extends SubscriptionState {
  String type;
  ChooseFirstSubscriptionState({required this.type});
}

class AddWifeOrHusbandState extends SubscriptionState {
  final bool type;
  AddWifeOrHusbandState({required this.type});
}

class ChooseImageState extends SubscriptionState {
  final String? image;
  ChooseImageState({required this.image});
}

class IndividualSubscriptionLoadingState extends SubscriptionState {}

class IndividualSubscriptionSuccessState extends SubscriptionState {
  final IndividualSubscriptionSuccessEntity individualSubscriptionSuccessEntity;
  IndividualSubscriptionSuccessState(
      {required this.individualSubscriptionSuccessEntity});
}

class IndividualSubscriptionErrorState extends SubscriptionState {
  final String message;
  IndividualSubscriptionErrorState({required this.message});
}

class StoreImageLoading extends SubscriptionState {}

class StoreImageSuccess extends SubscriptionState {
  final ImageEntity storeImageEntity;
  StoreImageSuccess({required this.storeImageEntity});
}

class StoreImageError extends SubscriptionState {
  final String msg;
  StoreImageError({required this.msg});
}

class SelectMaleGender extends SubscriptionState {
  final Gender gender;
  SelectMaleGender({required this.gender});
}
class SelectFemaleGender extends SubscriptionState{
 final Gender gender;
  SelectFemaleGender({required this.gender});
}

