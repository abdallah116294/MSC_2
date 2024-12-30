import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:msc_2/core/extensions/context_extensions.dart';
import 'package:msc_2/core/localization/lang_keys.dart';
import 'package:msc_2/features/subscription/cubit/subscription_cubit.dart';
import 'package:msc_2/features/subscription/widgets/reusable_checkbox_widget.dart';

class InsuranceCheckBoxWidget extends StatelessWidget {
  const InsuranceCheckBoxWidget({
    super.key,
    required this.cubit,
  });

  final SubscriptionCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: ReusableCheckbox(
              keyIdentifier: "individual",
              label:
                  context.translate(LangKeys.individual_insurance),
              onChanged: (ischecked) {
                if (ischecked) {
                  cubit.fimalyinsubscription("individual");
                  cubit.controllers.keyIdentifier = "individual";
                  log(cubit.controllers.keyIdentifier);
                } else {
                  if (cubit.controllers.keyIdentifier ==
                      "individual") {
                    cubit.fimalyinsubscription("individual");
                  } else {
                    cubit.controllers.keyIdentifier = "family";
                    cubit.fimalyinsubscription("family");
                    log(cubit.controllers.keyIdentifier);
                  }
                }
                //log("${context.translate(LangKeys.individual_insurance)}$ischecked");
              },
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: ReusableCheckbox(
              keyIdentifier: "family",
              label: context.translate(LangKeys.family_insurance),
              onChanged: (ischecked) {
                if (ischecked) {
                  cubit.fimalyinsubscription("family");
                  cubit.controllers.keyIdentifier = "family";
                  log(cubit.controllers.keyIdentifier);
                } else {
                  if (cubit.controllers.keyIdentifier == "family") {
                    cubit.fimalyinsubscription("individual");
                  } else {
                    cubit.controllers.keyIdentifier = "individual";
                    cubit.fimalyinsubscription("individual");
                    log(cubit.controllers.keyIdentifier);
                  }
                }
                //  log("${context.translate(LangKeys.family_insurance)}$ischecked");
              },
            ),
          ),
        ],
      ),
    );
  }
}

