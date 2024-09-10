import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttter_fundamental_submission_2/src/core/utils/custom_text_style.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/presentation/widget/shimmer_loading_widget.dart';

Widget listRestaurantsShimmerWidget() {
  return Stack(
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
            shimmerLoadingWidget(
              child: Container(
                height: 80.h,
                width: 110.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.black,
                ),
              ),
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
                  shimmerLoadingWidget(
                    child: Text(
                      'loading',
                      style: CustomTextStyle.bodyLarge.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  SizedBox(
                    height: 2.h,
                  ),

                  /// resto city location
                  shimmerLoadingWidget(
                    child: Row(
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
                          'loading',
                          style: CustomTextStyle.bodyMedium.copyWith(
                            fontSize: 12.sp,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 6.h,
                  ),

                  /// resto description
                  shimmerLoadingWidget(
                    child: Text(
                      'loading...',
                      style: CustomTextStyle.bodyMedium.copyWith(
                        fontSize: 11.sp,
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 4,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                    ),
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
        child: SizedBox(
          width: 60.w,
          child: Padding(
            padding: EdgeInsets.only(
              top: 7.h,
              bottom: 3.h,
            ),
            child: shimmerLoadingWidget(
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
                    '5',
                    style: CustomTextStyle.bodyMedium.copyWith(
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
