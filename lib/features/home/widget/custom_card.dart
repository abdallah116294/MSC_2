import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:msc_2/core/utils/app_color.dart';
import 'package:msc_2/features/home/widget/right_custom_paint.dart';
import 'package:msc_2/features/home/widget/substract2_paint_widget.dart';
import 'package:msc_2/features/home/widget/substract_paint_widget.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 8.0, right: 10),
      child: SizedBox(
         height: 170,
      width: double.infinity,
        child: Stack(
          children: [
            Positioned(
                right: 0,
                child: Container(
                  height: 170,
                  width: 327,
                  decoration: BoxDecoration(
                      color: AppColor.spinBoxColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Stack(
                    children: [
                      Positioned(
                          top: 18,
                          right: 15,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset("assets/images/msc_text.png"),
                                  SizedBox(
                                    width: 6.w,
                                  ),
                                  Image.asset("assets/images/msc_icon.png")
                                ],
                              ),
                              const SizedBox(height: 12),
                              Text("الاسم: Abdaallah"),
                              Text("رقم البطاقة: 502"),
                              Text("نوع التأمين: أفراد"),
                              Text("تاريخ انتهاء البطاقة: 20/10/2025"),
                              Text("تاريخ الميلاد:8/10/1959"),
                            ],
                          ))
                    ],
                  ),
                )),
            Positioned(
              left: 0,
              child: ClipPath(
                clipper: RightCurvedPainter(),
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColor.instructionSubColor,
                      borderRadius: BorderRadius.circular(10)),
                  width: 170.h,
                  height: 170.h,
                  child: Stack(
                    children: [
                      Positioned(
                          top: 15,
                          left: 15,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset("assets/images/qr_code.png"),
                              const SizedBox(height: 12),
                              Text("زورو موقعنا",
                                  style: TextStyle(color: Colors.white)),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 120.h,
              top: 0,
              child: ClipPath(
                clipper: Substract2PaintWidget(),
                child: Container(
                  height: 170.h,
                  width: 69.w,
                  color: AppColor.substractColor2,
                ),
              ),
            ),
            Positioned(
              left: 129.5,
              //right: 11,
              top: 0,
              child: ClipPath(
                clipper: SubstractPaintWidget(),
                child: Container(
                  height: 170.h,
                  width: 69.w,
                  color: AppColor.substractColor1,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
