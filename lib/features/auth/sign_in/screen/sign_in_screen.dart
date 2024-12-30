import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:msc_2/core/cache/cache_helper.dart';
import 'package:msc_2/core/extensions/context_extensions.dart';
import 'package:msc_2/core/localization/lang_keys.dart';
import 'package:msc_2/core/utils/app_color.dart';
import 'package:msc_2/core/widgets/custom_text.dart';
import 'package:msc_2/core/widgets/snack_bar.dart';
import 'package:msc_2/features/app/cubit/app_cubit.dart';
import 'package:msc_2/features/auth/sign_in/cubit/sign_in_cubit.dart';
import 'package:msc_2/features/auth/sign_in/widgets/buttom_part_sign_in_widget.dart';
import 'package:msc_2/features/auth/sign_in/widgets/toggel_language_buttom.dart';
import 'package:msc_2/features/auth/sign_in/widgets/top_part_sign_in_widget.dart';
import 'package:msc_2/injection_container.dart' as di;

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<SignInCubit>(context);
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInLoading) {
          log('Loading');
        } else if (state is SignInSuccess) {
          showMessage(
              message: state.signInSuccessModel.message.toString(),
              isError: false);
          log('Success');
        } else if (state is SignInError) {
                showMessage(
              message: state.message.toString(),
              isError: true);
          log('Error');
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: AppColor.signInBackgroundColor,
          body: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          const TopSignInPart(
                            languageButton: ToggleLanguageButton(),
                          ),
                          SizedBox(
                              height: constraints.maxHeight *
                                  .5), // Placeholder for spacing
                        ],
                      ),
                      BottomContainer(
                        cubit: cubit,
                        formKey: _formKey,
                        signInButton: () {},
                        phoneNumberController: phoneController,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
