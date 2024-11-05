import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:msc_2/core/localization/lang_keys.dart';
import 'package:msc_2/features/on_boarding/widgets/titles_widget.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial());
  int currentPage = 0;
  PageController pageController = PageController();
  List<Widget> titlesWidget = [
    const TitleWidgets(
      titlekey: LangKeys.quick,
      descriptionKey:
         LangKeys.subscribe_
    ),
    const TitleWidgets(
      titlekey: LangKeys.nearby,
      descriptionKey:
          LangKeys.discover,
    ),
    const TitleWidgets(
      titlekey: LangKeys.track,
      descriptionKey:
          LangKeys.montior
    ),
  ];
  void scrollToNextPage() {
    if (currentPage < 3) {
      // Assuming 4 images, update this number based on total images
      pageController.animateToPage(
        currentPage + 1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
      //emit(AppartmentDetailsPageChanged(currentPage: currentPage));
    }
  }

  void updateCurrentPage(int index) {
    currentPage = index;
    emit(OnBoardingPageChanged(currentPage: index));
  }

  void scrollToPreviousPage() {
    if (currentPage > 0) {
      pageController.animateToPage(
        currentPage - 1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }
}
