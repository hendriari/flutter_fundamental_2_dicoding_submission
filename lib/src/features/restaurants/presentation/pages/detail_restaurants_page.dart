import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttter_fundamental_submission_2/src/core/injector/injection.dart';
import 'package:fluttter_fundamental_submission_2/src/core/utils/enums.dart';
import 'package:fluttter_fundamental_submission_2/src/core/utils/helper.dart';
import 'package:fluttter_fundamental_submission_2/src/core/utils/hex_color.dart';
import 'package:fluttter_fundamental_submission_2/src/core/utils/my_colors.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/presentation/viewmodel/restaurants_viewmodel.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/presentation/widget/detail_restaurants_widget/card_other_food_widget.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/presentation/widget/detail_restaurants_widget/card_review_widget.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/presentation/widget/detail_restaurants_widget/detail_restaurants_shimmer_widget.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/presentation/widget/image_widget.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/presentation/widget/refresh_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class DetailRestaurantsPage extends StatefulWidget {
  final String? id;

  const DetailRestaurantsPage({
    super.key,
    required this.id,
  });

  @override
  State<DetailRestaurantsPage> createState() => _DetailRestaurantsPageState();
}

class _DetailRestaurantsPageState extends State<DetailRestaurantsPage> {
  late RestaurantsViewModel _restaurantsViewModel;
  late Helper _helper;
  final ValueNotifier<bool> _showDescription = ValueNotifier(false);

  @override
  void initState() {
    _restaurantsViewModel =
        Provider.of<RestaurantsViewModel>(context, listen: false);
    _helper = getIt<Helper>();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _restaurantsViewModel.getDetailRestaurants(
        id: widget.id,
        onError: (error) => _helper.showToast(
          message: error ?? 'someting error',
          backgroundColor: HexColor('8b0000'),
          textColor: Colors.white,
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (pop) {
        _restaurantsViewModel.clearTempDetailRestaurants();
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 10.h),
            physics: const ScrollPhysics(),
            child: Consumer<RestaurantsViewModel>(
              builder: (context, restaurantsProvider, child) {
                return restaurantsProvider.loadingGetDetailRestaurants ==
                            StateOfConnection.waiting ||
                        restaurantsProvider.loadingGetDetailRestaurants ==
                            StateOfConnection.doNothing
                    ? const DetailRestaurantsShimmerWidget()
                    : restaurantsProvider.loadingGetListRestaurants ==
                            StateOfConnection.failed
                        ? refreshWidget(
                            textInfo: 'Oops, something went wrong',
                            onTap: () async {
                              await restaurantsProvider.getDetailRestaurants(
                                id: widget.id,
                                onError: (error) => _helper.showToast(
                                  message: error ?? 'someting error',
                                  backgroundColor: HexColor('8b0000'),
                                  textColor: Colors.white,
                                ),
                              );
                            },
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// IMAGE RESTAURANTS
                              Stack(
                                children: [
                                  /// image resto
                                  ImageWidget(
                                    imageUrl: restaurantsProvider
                                                .detailRestaurants?.pictureId !=
                                            null
                                        ? restaurantsProvider
                                            .restaurantsPictureUrl(
                                                restaurantsProvider
                                                    .detailRestaurants
                                                    ?.pictureId)
                                        : null,
                                    imageWidth: double.infinity,
                                    imageHeight: 180.h,
                                    borderRadius: 0,
                                  ),

                                  /// back button
                                  InkWell(
                                    onTap: () => context.pop(),
                                    splashColor: MyColors.primary800,
                                    child: Container(
                                      height: 30.sp,
                                      width: 30.sp,
                                      margin: EdgeInsets.only(
                                        top: 10.h,
                                        left: 12.w,
                                      ),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: MyColors.primary400,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.arrow_back,
                                        size: 22.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              /// RESTAURANTS NAME, LOCATION, & RATING
                              paddingContent(
                                top: 8.h,
                                child: Row(
                                  children: [
                                    /// NAME & LOCATION
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            restaurantsProvider
                                                    .detailRestaurants?.name ??
                                                '-',
                                            style: TextStyle(
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w600,
                                              color: MyColors.primary500,
                                            ),
                                          ),

                                          SizedBox(
                                            height: 1.h,
                                          ),

                                          /// LOCATION
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
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
                                                  '${restaurantsProvider.detailRestaurants?.address ?? '-'}, ${restaurantsProvider.detailRestaurants?.city ?? '-'}',
                                                  style: TextStyle(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),

                                    /// RATING
                                    Container(
                                      padding: EdgeInsets.only(
                                        top: 4.h,
                                        bottom: 4.h,
                                        left: 8.w,
                                        right: 8.w,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                            color: MyColors.primary500),
                                        color: Colors.white,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.star,
                                            size: 16.sp,
                                            color:
                                                Colors.orange.withOpacity(.6),
                                          ),

                                          SizedBox(
                                            width: 4.w,
                                          ),

                                          /// ranting resto
                                          Text(
                                            '${restaurantsProvider.detailRestaurants?.rating}',
                                            style: TextStyle(fontSize: 14.sp),
                                          ),
                                        ],
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

                              /// DESCRIPTION
                              ValueListenableBuilder(
                                  valueListenable: _showDescription,
                                  builder: (context, desc, c) {
                                    return Column(
                                      children: [
                                        paddingContent(
                                          top: 4.h,
                                          child: Text(
                                            restaurantsProvider
                                                    .detailRestaurants
                                                    ?.description ??
                                                '-',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                  fontSize: 12.sp,
                                                ),
                                            textAlign: TextAlign.justify,
                                            maxLines: _showDescription.value
                                                ? null
                                                : 4,
                                            overflow: TextOverflow.visible,
                                          ),
                                        ),
                                        Center(
                                          child: GestureDetector(
                                            onTap: () =>
                                                _showDescription.value =
                                                    !_showDescription.value,
                                            child: Container(
                                              height: 20.h,
                                              width: 180.w,
                                              alignment: Alignment.center,
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    _showDescription.value
                                                        ? 'Show Less'
                                                        : 'Show More',
                                                    style: TextStyle(
                                                      fontSize: 11.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  SizedBox(
                                                    width: 2.w,
                                                  ),
                                                  Icon(
                                                    _showDescription.value
                                                        ? Icons
                                                            .keyboard_arrow_up_sharp
                                                        : Icons
                                                            .keyboard_arrow_down_sharp,
                                                    size: 12.sp,
                                                    color: Colors.grey,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  }),

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

                              SizedBox(
                                height: 5.h,
                              ),

                              /// LIST FOODS
                              SizedBox(
                                height: 120.h,
                                width: double.infinity,
                                child: ListView.builder(
                                    itemCount: restaurantsProvider
                                        .detailRestaurants
                                        ?.restaurantsMenu
                                        ?.listFoods
                                        ?.length,
                                    shrinkWrap: true,
                                    padding: EdgeInsets.only(
                                      left: 4.w,
                                      right: 4.w,
                                      top: 4.h,
                                      bottom: 4.h,
                                    ),
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      var foodData = restaurantsProvider
                                          .detailRestaurants
                                          ?.restaurantsMenu
                                          ?.listFoods?[index];
                                      return cardOtherFoodWidget(
                                        context: context,
                                        foodImage:
                                            'https://wallpaperaccess.com/full/767054.jpg',
                                        foodName: foodData?.name ?? '-',
                                      );
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

                              SizedBox(
                                height: 5.h,
                              ),

                              /// LIST DRINKS
                              SizedBox(
                                height: 120.h,
                                width: double.infinity,
                                child: ListView.builder(
                                    itemCount: restaurantsProvider
                                        .detailRestaurants
                                        ?.restaurantsMenu
                                        ?.listDrinks
                                        ?.length,
                                    shrinkWrap: true,
                                    padding: EdgeInsets.only(
                                      left: 4.w,
                                      right: 4.w,
                                      top: 4.h,
                                      bottom: 4.h,
                                    ),
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      var drinksData = restaurantsProvider
                                          .detailRestaurants
                                          ?.restaurantsMenu
                                          ?.listDrinks?[index];
                                      return cardOtherFoodWidget(
                                        context: context,
                                        foodImage:
                                            'https://www.tripsavvy.com/thmb/PFDjnTE6uvm68-ET81juZGjdRnM=/3867x2578/filters:fill(auto,1)/cocktails-56a238c25f9b58b7d0c8076f.jpg',
                                        foodName: drinksData?.name ?? '-',
                                      );
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

                              /// TEXT REVIEW
                              restaurantsProvider
                                              .detailRestaurants?.listReview ==
                                          null ||
                                      restaurantsProvider.detailRestaurants!
                                          .listReview!.isEmpty
                                  ? const SizedBox()
                                  : paddingContent(
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
                                          GestureDetector(
                                            onTap: () {
                                              if (restaurantsProvider
                                                      .detailRestaurants?.id !=
                                                  null) {
                                                context.push(
                                                  '/restaurants/restaurants-detail/${restaurantsProvider.detailRestaurants!.id!}/add-review',
                                                );
                                              }
                                            },
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                left: 3.w,
                                                top: 2.h,
                                                bottom: 2.h,
                                              ),
                                              margin:
                                                  EdgeInsets.only(left: 3.w),
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
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                              SizedBox(
                                height: restaurantsProvider.detailRestaurants
                                                ?.listReview ==
                                            null ||
                                        restaurantsProvider.detailRestaurants!
                                            .listReview!.isEmpty
                                    ? 0
                                    : 1.h,
                              ),

                              /// LIST REVIEW
                              restaurantsProvider
                                              .detailRestaurants?.listReview ==
                                          null ||
                                      restaurantsProvider.detailRestaurants!
                                          .listReview!.isEmpty
                                  ? const SizedBox()
                                  : SizedBox(
                                      height: 86.h,
                                      width: double.infinity,
                                      child: ListView.builder(
                                          itemCount: restaurantsProvider
                                                          .listReviewData !=
                                                      null &&
                                                  restaurantsProvider
                                                      .listReviewData!
                                                      .isNotEmpty
                                              ? restaurantsProvider
                                                  .listReviewData?.length
                                              : restaurantsProvider
                                                  .detailRestaurants
                                                  ?.listReview
                                                  ?.length,
                                          shrinkWrap: true,
                                          padding: EdgeInsets.only(
                                            left: 4.w,
                                            right: 4.w,
                                            top: 4.h,
                                            bottom: 4.h,
                                          ),
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            var reviewData = restaurantsProvider
                                                            .listReviewData !=
                                                        null &&
                                                    restaurantsProvider
                                                        .listReviewData!
                                                        .isNotEmpty
                                                ? restaurantsProvider
                                                    .listReviewData![index]
                                                : restaurantsProvider
                                                    .detailRestaurants
                                                    ?.listReview?[index];
                                            return cardReviewWidget(
                                              reviewerName: reviewData?.name,
                                              date: reviewData?.date,
                                              description: reviewData?.review,
                                            );
                                          }),
                                    ),
                            ],
                          );
              },
            ),
          ),
        ),
      ),
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
}
