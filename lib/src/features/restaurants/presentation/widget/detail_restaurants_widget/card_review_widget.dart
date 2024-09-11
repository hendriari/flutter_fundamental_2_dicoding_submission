import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttter_fundamental_submission_2/src/core/utils/my_colors.dart';

Widget cardReviewWidget({
  required String? reviewerName,
  required String? date,
  required String? description,
}) {
  return Container(
    width: 200.w,
    margin: EdgeInsets.only(
      left: 4.w,
      right: 4.w,
    ),
    padding: EdgeInsets.only(
      left: 8.w,
      right: 8.w,
      top: 8.h,
      bottom: 8.h,
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
        Row(
          children: [
            Icon(
              Icons.person_2_outlined,
              size: 14.sp,
              color: MyColors.primary600,
            ),
            SizedBox(
              width: 3.w,
            ),
            Expanded(
              child: Text(
                reviewerName ?? '-',
                style: TextStyle(
                  fontSize: 13.sp,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              width: 2.w,
            ),
            Text(
              date ?? '-',
              style: TextStyle(
                fontSize: 11.sp,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Expanded(
          child: Text(
            description ?? '-',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );
}
