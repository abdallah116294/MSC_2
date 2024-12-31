part of 'nav_bar_cubit.dart';

sealed class NavBarState extends Equatable {
    final int currentIndex;
  const NavBarState({required this.currentIndex});

  @override
  List<Object> get props => [];
}

final class NavBarInitial extends NavBarState {
  const NavBarInitial({required int currentIndex}) : super(currentIndex: currentIndex);
}
class ChangeBottomNavigationState extends NavBarState {
  ChangeBottomNavigationState({required super.currentIndex});
}
