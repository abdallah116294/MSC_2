import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msc_2/core/app_methods/app_methods.dart';
import 'package:msc_2/features/subscription/peresentation/cubit/subscription_cubit.dart';
import 'package:msc_2/features/subscription/peresentation/widgets/subscription_button_widget.dart';

class IndividualSubscriptionCaseButtonWidget extends StatelessWidget {
  const IndividualSubscriptionCaseButtonWidget({
    super.key,
    required this.cubit,
    required this.genderText,
  });

  final SubscriptionCubit cubit;
  final String genderText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // if (isImageSelected)
        SubscriptionButtonWidget(
          onPressed: () {
            log("Phone number " + cubit.controllers.phoneController.text);
            // Upload the image and then upload the user data for subscription
            context
                .read<SubscriptionCubit>()
                .storeImage(cubit.selectedImage!)
                .then((value) {
              log("Phone number " + cubit.controllers.phoneController.text);
              context.read<SubscriptionCubit>().individualSubscription(
                  cubit.controllers.nameController.text,
                  AppMethods.calculateAge(cubit.controllers.date).toString(),
                  genderText,
                  cubit.controllers.phoneController.text,
                  "10",
                  cubit.controllers.imageEntity!.image.id.toString());
            });
          },
        ),
      ],
    );
  }
}
