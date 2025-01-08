// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:msc_2/core/extensions/context_extensions.dart';
// import 'package:msc_2/core/localization/lang_keys.dart';
// import 'package:msc_2/core/utils/app_color.dart';
// import 'package:msc_2/core/widgets/custom_text.dart';
// import 'package:msc_2/features/subscription/cubit/subscription_cubit.dart';

// class CheckBoxWidget extends StatelessWidget {
//   CheckBoxWidget({
//     super.key,
//     required this.isChecked,
//     required this.subscriptionType,
//     // required this.subscriptionNumber,
//     this.onChanged,
//   });
//   final Function(bool)? onChanged;
//   bool isChecked;
//   String subscriptionType;
//   // int subscriptionNumber;
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => SubscriptionCubit(),
//       child: Builder(builder: (context) {
//         final checkBoxCubit = context.read<SubscriptionCubit>();
//         return Container(
//           width: 156.w,
//           height: 44.h,
//           decoration: BoxDecoration(
//               color: AppColor.grey.withOpacity(.3),
//               border: Border.all(
//                   color: isChecked == true
//                       ? AppColor.checkedColor
//                       : AppColor.grey.withOpacity(.3)),
//               borderRadius: BorderRadius.all(Radius.circular(12.r))),
//           child: Row(
//             children: [
//               BlocBuilder<SubscriptionCubit, bool>(
//                 builder: (context, state) {
//                   return Checkbox(
//                       activeColor: AppColor.primary,
//                       shape: const OvalBorder(side: BorderSide(width: 12)),
//                       value: isChecked,
//                       onChanged: (value) {
//                         checkBoxCubit.toggleCheckbox();
//                         if (onChanged != null) onChanged!(isChecked);
//                         //log("isChceked ${isChecked} number ${subscriptionNumber}");
//                         // BlocProvider.of<SubscriptionCubit>(context)
//                         //     .chooseSubscription(value!, subscriptionNumber);
//                       });
//                 },
//               ),
//               SizedBox(
//                 width: 5.w,
//               ),
//               CustomText(
//                   text: subscriptionType,
//                   fontFamily: "Cairo",
//                   color: AppColor.black,
//                   fontWeight: FontWeight.w500,
//                   fontSize: 13.sp)
//             ],
//           ),
//         );
//       }),
//     );
//   }
// }
