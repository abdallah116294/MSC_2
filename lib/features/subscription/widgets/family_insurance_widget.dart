import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:msc_2/core/extensions/context_extensions.dart';
import 'package:msc_2/core/localization/lang_keys.dart';
import 'package:msc_2/core/utils/app_color.dart';
import 'package:msc_2/core/widgets/custom_text.dart';
import 'package:msc_2/features/subscription/cubit/subscription_cubit.dart';
import 'package:msc_2/features/subscription/widgets/add_husbande_or_wife.dart';
import 'package:msc_2/features/subscription/widgets/add_son_or_dughter_widget.dart';

class FamilyInsuranceWidget extends StatelessWidget {
  const FamilyInsuranceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubscriptionCubit, SubscriptionState>(
        builder: (context, state) {
      return state is ChooseFirstSubscriptionState
          ? state.type == "family"
              ? Column(
                  children: [
                    SizedBox(
                      height: 24.h,
                    ),
                    AddHusbandOrWifeWidget(),
                    SizedBox(
                      height: 24.h,
                    ),
                    AddSonOrDaughterWidget(),
                  ],
                )
              : Container()
          : Container();
    });
  }
}
