import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msc_2/features/home/screen/home_screen.dart';
import 'package:msc_2/features/profile/screen/profile_screen.dart';
import 'package:msc_2/features/search/screen/search_screen.dart';

part 'nav_bar_state.dart';

class NavBarCubit extends Cubit<NavBarState> {
  NavBarCubit() : super(NavBarInitial(currentIndex: 0));
  int currentIndex = 0;
  void changeNavigationBottom(index) {
    currentIndex = index;
    emit(ChangeBottomNavigationState(currentIndex: index));
  }

  List<BottomNavigationBarItem> bottomNavigationBarItems(BuildContext context) {
    return const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.search),
        label: 'Search',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Profile',
      ),
    ];
  }

  List<Widget> screens = [
    const HomeScreenView(),
    const SearchScreenView(),
    const ProfileScreenView()
  ];

  Widget  getCurrentView(int currentIndex) => screens[currentIndex];
}
