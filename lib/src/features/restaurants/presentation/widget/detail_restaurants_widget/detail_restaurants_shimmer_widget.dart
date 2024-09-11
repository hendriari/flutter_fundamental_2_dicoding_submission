import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttter_fundamental_submission_2/src/core/utils/my_colors.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/presentation/widget/detail_restaurants_widget/card_review_widget.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/presentation/widget/shimmer_loading_widget.dart';

class DetailRestaurantsShimmerWidget extends StatelessWidget {
  const DetailRestaurantsShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// IMAGE RESTAURANTS
        shimmerLoadingWidget(
          child: Container(
            height: 180.h,
            width: double.infinity,
            color: Colors.black,
          ),
        ),

        /// RESTAURANTS NAME, LOCATION, & RATING
        paddingContent(
          top: 8.h,
          child: Row(
            children: [
              /// NAME & LOCATION
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    shimmerLoadingWidget(
                      child: Text(
                        'loading',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: MyColors.primary500,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 1.h,
                    ),

                    /// LOCATION
                    shimmerLoadingWidget(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 13.sp,
                            color: MyColors.primary600,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Expanded(
                            child: Text(
                              'loading..',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                              maxLines: 2,
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
              Padding(
                padding: EdgeInsets.only(
                  top: 4.h,
                  bottom: 4.h,
                  left: 8.w,
                  right: 8.w,
                ),
                child: shimmerLoadingWidget(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        size: 16.sp,
                        color: Colors.orange.withOpacity(.6),
                      ),

                      SizedBox(
                        width: 4.w,
                      ),

                      /// ranting resto
                      Text(
                        '5',
                        style: TextStyle(fontSize: 14.sp),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.only(
            top: 1.h,
            bottom: 1.h,
          ),
          child: Divider(
            color: Colors.grey.withOpacity(.1),
            thickness: 5,
          ),
        ),

        /// TEXT DESCRIPTION
        paddingContent(
          child: shimmerLoadingWidget(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.info_outline,
                  size: 13.sp,
                  color: MyColors.primary600,
                ),
                SizedBox(
                  width: 3.w,
                ),
                Expanded(
                  child: Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 13.sp,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),

        /// DESCRIPTION
        paddingContent(
          top: 4.h,
          child: shimmerLoadingWidget(
            child: SizedBox(
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 12.sp,
                    ),
                textAlign: TextAlign.justify,
                maxLines: 4,
                overflow: TextOverflow.visible,
              ),
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.only(
            top: 1.h,
            bottom: 1.h,
          ),
          child: Divider(
            color: Colors.grey.withOpacity(.1),
            thickness: 5,
          ),
        ),

        /// TEXT FOODS
        paddingContent(
          child: shimmerLoadingWidget(
            child: Row(
              children: [
                Icon(
                  Icons.fastfood_outlined,
                  size: 13.sp,
                  color: MyColors.primary600,
                ),
                SizedBox(
                  width: 3.w,
                ),
                Expanded(
                  child: Text(
                    'Foods',
                    style: TextStyle(
                      fontSize: 13.sp,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),

        SizedBox(
          height: 5.h,
        ),

        /// LIST FOODS
        SizedBox(
          height: 120.h,
          width: double.infinity,
          child: ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              padding: EdgeInsets.only(
                left: 4.w,
                right: 4.w,
                top: 4.h,
                bottom: 4.h,
              ),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return _foodDrinksCardShimmer();
              }),
        ),

        Padding(
          padding: EdgeInsets.only(
            top: 1.h,
            bottom: 1.h,
          ),
          child: Divider(
            color: Colors.grey.withOpacity(.1),
            thickness: 5,
          ),
        ),

        /// TEXT DRINKS
        paddingContent(
          child: shimmerLoadingWidget(
            child: Row(
              children: [
                Icon(
                  Icons.emoji_food_beverage_outlined,
                  size: 13.sp,
                  color: MyColors.primary600,
                ),
                SizedBox(
                  width: 3.w,
                ),
                Expanded(
                  child: Text(
                    'Drinks',
                    style: TextStyle(
                      fontSize: 13.sp,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),

        SizedBox(
          height: 5.h,
        ),

        /// LIST DRINKS
        SizedBox(
          height: 120.h,
          width: double.infinity,
          child: ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            padding: EdgeInsets.only(
              left: 4.w,
              right: 4.w,
              top: 4.h,
              bottom: 4.h,
            ),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => _foodDrinksCardShimmer(),
          ),
        ),

        Padding(
          padding: EdgeInsets.only(
            top: 1.h,
            bottom: 1.h,
          ),
          child: Divider(
            color: Colors.grey.withOpacity(.1),
            thickness: 5,
          ),
        ),

        /// TEXT REVIEW
        paddingContent(
          child: shimmerLoadingWidget(
            child: Row(
              children: [
                Icon(
                  Icons.reviews_outlined,
                  size: 13.sp,
                  color: MyColors.primary600,
                ),
                SizedBox(
                  width: 3.w,
                ),
                Expanded(
                  child: Text(
                    'Review',
                    style: TextStyle(
                      fontSize: 13.sp,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                /// ADD REVIEW
                Container(
                  padding: EdgeInsets.only(
                    left: 3.w,
                    top: 2.h,
                    bottom: 2.h,
                  ),
                  margin: EdgeInsets.only(left: 3.w),
                  child: Row(
                    children: [
                      Icon(
                        Icons.rate_review_outlined,
                        size: 13.sp,
                        color: MyColors.primary600,
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Text(
                        'Add Review',
                        style: TextStyle(
                          fontSize: 13.sp,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        SizedBox(
          height: 1.h,
        ),

        /// LIST REVIEW
        SizedBox(
          height: 85.h,
          width: double.infinity,
          child: ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              padding: EdgeInsets.only(
                left: 4.w,
                right: 4.w,
                top: 4.h,
                bottom: 4.h,
              ),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return shimmerLoadingWidget(
                  child: cardReviewWidget(
                    reviewerName: 'loading',
                    date: 'loading',
                    description: 'loading',
                  ),
                );
              }),
        ),
      ],
    );
  }

  Widget paddingContent({
    required Widget child,
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: left ?? 8.w,
        right: right ?? 8.w,
        top: top ?? 0,
        bottom: bottom ?? 0,
      ),
      child: child,
    );
  }

  Widget _foodDrinksCardShimmer() {
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
          shimmerLoadingWidget(
            child: Container(
              height: 70.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 6.h,
          ),
          Expanded(
            child: shimmerLoadingWidget(
              child: Text(
                'loading',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
        ],
      ),
    );
  }
}
