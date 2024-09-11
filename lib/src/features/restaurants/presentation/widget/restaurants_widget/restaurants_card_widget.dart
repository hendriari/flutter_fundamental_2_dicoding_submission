import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/presentation/widget/image_widget.dart';

Widget restaurantsCardWidget({
  required BuildContext context,
  required String restoName,
  required String restoDescription,
  required String restoCityLocation,
  required String restoRanting,
  required String? restoImageUrl,
  Function()? onTap,
}) {
  return InkWell(
    onTap: onTap,
    splashColor: Colors.white,
    borderRadius: BorderRadius.circular(16),
    child: Stack(
      children: [
        /// CONTENT
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(
            top: 4.h,
            bottom: 8.h,
            right: 1.w,
            left: 1.w,
          ),
          padding: EdgeInsets.only(
            left: 8.w,
            right: 8.w,
            top: 6.h,
            bottom: 6.h,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.7),
                blurRadius: 3,
                blurStyle: BlurStyle.solid,
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// IMAGE RESTAURANTS
              ImageWidget(
                imageUrl: restoImageUrl,
                imageHeight: 100.h,
                imageWidth: 110.w,
              ),

              SizedBox(
                width: 10.w,
              ),

              /// INFO RESTAURANTS
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// resto name
                    Text(
                      restoName,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    SizedBox(
                      height: 2.h,
                    ),

                    /// resto city location
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 13.sp,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Text(
                          restoCityLocation,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 6.h,
                    ),

                    /// resto description
                    Text(
                      restoDescription,
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 4,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        /// RATING
        Align(
          alignment: Alignment.topRight,
          child: Container(
            padding: EdgeInsets.only(
              top: 3.h,
              bottom: 3.h,
            ),
            margin: EdgeInsets.only(top: 4.h),
            alignment: Alignment.center,
            width: 60.w,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.orange.withOpacity(.8),
                width: 1,
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40),
                topRight: Radius.circular(16),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  size: 13.sp,
                  color: Colors.orange.withOpacity(.6),
                ),

                SizedBox(
                  width: 2.sp,
                ),

                /// ranting resto
                Text(
                  restoRanting,
                  style: TextStyle(
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
