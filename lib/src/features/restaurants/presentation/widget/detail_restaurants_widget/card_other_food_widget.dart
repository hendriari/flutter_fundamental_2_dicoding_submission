import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/presentation/widget/image_widget.dart';

Widget cardOtherFoodWidget({
  required BuildContext context,
  required String foodImage,
  required String foodName,
}) {
  return Container(
    width: 110.w,
    margin: EdgeInsets.only(
      left: 4.w,
      right: 4.w,
    ),
    padding: EdgeInsets.only(
      left: 4.w,
      right: 4.w,
      top: 4.h,
      bottom: 4.h,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(.6),
          blurRadius: 3,
          blurStyle: BlurStyle.solid,
        )
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ImageWidget(
          imageUrl: foodImage,
          imageHeight: 70.h,
          imageWidth: double.infinity,
          borderRadius: 12,
        ),
        SizedBox(
          height: 6.h,
        ),
        Expanded(
          child: Text(
            foodName,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    ),
  );
}
