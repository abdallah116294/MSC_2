import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:msc_2/core/extensions/context_extensions.dart';
import 'package:msc_2/core/localization/lang_keys.dart';
import 'package:msc_2/core/utils/app_color.dart';
import 'package:msc_2/core/utils/assets_helper.dart';
import 'package:msc_2/core/widgets/custom_text.dart';
import 'package:msc_2/core/widgets/svg_icon.dart';
import 'package:msc_2/features/home/screen/home_screen.dart';
import 'package:msc_2/features/nav_bar/cubit/nav_bar_cubit.dart';
import 'package:msc_2/features/nav_bar/widgets/nav_bar_item_widget.dart';
import 'package:msc_2/features/profile/screen/profile_screen.dart';
import 'package:msc_2/features/renewal/screens/renewal_screen.dart';
import 'package:msc_2/features/search/screen/search_screen.dart';
import 'package:msc_2/injection_container.dart' as di;

class NavBarView extends StatelessWidget {
  const NavBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return const NavBarBody();
  }
}

class NavBarBody extends StatefulWidget {
  const NavBarBody({super.key});

  @override
  State<NavBarBody> createState() => _NavBarBodyState();
}

class _NavBarBodyState extends State<NavBarBody> {
  int currentIndex = 0;

  List<Widget> _screens = [
    const HomeScreenView(),
    const SearchScreenView(),
    const RenewalScreenView(),
    const ProfileScreenView()
  ];

  @override
  Widget build(BuildContext context) {
    //final cubit = BlocProvider.of<NavBarCubit>(context);
    return Scaffold(
      backgroundColor: AppColor.white,
      body: _screens[currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
       backgroundColor: AppColor.floatingButtonColor,
       shape:CircleBorder(
        eccentricity: 1
       ) ,
        onPressed: () {},
        child: Container(
          height: 100.h,
          width: 52.w,
          decoration: BoxDecoration(
            color:AppColor.floatingButtonColor ,
            shape: BoxShape.circle 
          ),
          child: const Center(
            child: SvgIcon(icon: AssetsHelper.floatingActionIcon, color: AppColor.white,height: 50,),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        shadowColor: AppColor.gradient1,
        color: AppColor.white,
        elevation: 0.0,
        child: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              currentIndex == 0
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = 0;
                        });
                      },
                      child: NavBarItemWidget(
                          label: context.translate(LangKeys.home),
                          iconPath: AssetsHelper.homeColoredIcon,
                          selectedColor: AppColor.primary))
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = 0;
                        });
                      },
                      child:  NavBarItemWidget(
                          label: context.translate(LangKeys.home),
                          iconPath: AssetsHelper.homUncoloredIcon,
                          selectedColor: AppColor.grey)),
              currentIndex == 1
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = 1;
                        });
                      },
                      child: NavBarItemWidget(
                          label: context.translate(LangKeys.search),
                          iconPath: AssetsHelper.searchedColoredIcon,
                          selectedColor: AppColor.primary),
                    )
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = 1;
                        });
                      },
                      child:  NavBarItemWidget(
                          label: context.translate(LangKeys.search),
                          iconPath: AssetsHelper.searchUncoloredIcon,
                          selectedColor: AppColor.grey),
                    ),
                    SizedBox(width: 5.w,),
                       currentIndex == 2
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = 2;
                        });
                      },
                      child: NavBarItemWidget(
                          label: context.translate(LangKeys.subscription_renewal),
                          iconPath: AssetsHelper.renewalColoredIcon,
                          selectedColor: AppColor.primary),
                    )
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = 2;
                        });
                      },
                      child:  NavBarItemWidget(
                          label: context.translate(LangKeys.subscription_renewal),
                          iconPath: AssetsHelper.renewalColoredIcon,
                          selectedColor: AppColor.grey),
                    ),
              currentIndex == 3
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = 3;
                        });
                      },
                      child: NavBarItemWidget(
                          label: context.translate(LangKeys.profile),
                          iconPath: AssetsHelper.profileColoredIcon,
                          selectedColor: AppColor.primary),
                    )
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = 3;
                        });
                      },
                      child:  NavBarItemWidget(
                          label: context.translate(LangKeys.profile),
                          iconPath: AssetsHelper.profileUnColoredIcon,
                          selectedColor: AppColor.grey),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
