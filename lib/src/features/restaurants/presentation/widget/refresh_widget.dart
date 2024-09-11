import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttter_fundamental_submission_2/src/core/utils/my_colors.dart';

Widget refreshWidget({
  required String textInfo,
  Function()? onTap,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        textInfo,
        style: TextStyle(
          fontSize: 16.sp,
        ),
      ),

      SizedBox(
        height: 4.h,
      ),

      /// REFRESH BUTTON
      ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: MyColors.primary600,
            ),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.refresh,
              color: Colors.black,
              size: 16.sp,
            ),
            SizedBox(
              width: 6.w,
            ),
            Text(
              'Refresh',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
