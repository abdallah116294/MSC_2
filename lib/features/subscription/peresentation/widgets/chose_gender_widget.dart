import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msc_2/core/utils/app_color.dart';
import 'package:msc_2/features/subscription/peresentation/cubit/controllers.dart';
import 'package:msc_2/features/subscription/peresentation/cubit/subscription_cubit.dart';

class GenderSelectionWidget extends StatelessWidget {
  GenderSelectionWidget({required this.subscriptionCubit});
  final SubscriptionCubit subscriptionCubit;
  @override
  Widget build(BuildContext context) {
    //subscriptionCubit.selectFemale();
    return BlocBuilder<SubscriptionCubit, SubscriptionState>(
      builder: (context, state) {
        Gender chooseGender = Gender.male;
        if (state is SelectMaleGender) {
          chooseGender = state.gender;
        } else if (state is SelectFemaleGender) {
          chooseGender = state.gender;
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Male button
            ToggleButtons(
              selectedColor: AppColor.primary,
              disabledBorderColor: AppColor.grey,
              borderRadius: BorderRadius.circular(20),
              isSelected: [
                chooseGender == Gender.male,
                chooseGender == Gender.female
              ],
              onPressed: (index) {
                log("Selected Gender ${state}");
                if (index == 0) {
                  subscriptionCubit.selectMale();

                  //   context.read<SubscriptionCubit>().selectMale();  // Change to Male
                } else {
                  subscriptionCubit.selectFemale();
                  // context
                  //     .read<SubscriptionCubit>()
                  //     .selectFemale(); // Change to Female
                }
              },
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Male',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Female',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
