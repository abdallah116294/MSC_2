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
// final class ChooseSecondSubscriptionState extends SubscriptionState {
//   bool isChecked;
//   ChooseSecondSubscriptionState({required this.isChecked});
// }
