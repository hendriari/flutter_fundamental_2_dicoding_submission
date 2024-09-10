import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttter_fundamental_submission_2/src/core/utils/custom_text_style.dart';
import 'package:fluttter_fundamental_submission_2/src/core/utils/enums.dart';
import 'package:fluttter_fundamental_submission_2/src/core/utils/my_colors.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/presentation/viewmodel/restaurants_viewmodel.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/presentation/widget/form_field_widget.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/presentation/widget/header_presistent.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/presentation/widget/list_restaurants_shimmer_widget.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/presentation/widget/restaurants_card_widget.dart';
import 'package:provider/provider.dart';

class ListRestaurantsPage extends StatefulWidget {
  const ListRestaurantsPage({super.key});

  @override
  State<ListRestaurantsPage> createState() => _ListRestaurantsPageState();
}

class _ListRestaurantsPageState extends State<ListRestaurantsPage> {
  @override
  void initState() {
    final restaurants =
        Provider.of<RestaurantsViewModel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await restaurants.getListRestaurants();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: 8.h,
            right: 10.w,
            left: 10.w,
          ),
          child: Consumer<RestaurantsViewModel>(
            builder: (context, restaurantsProvider, child) {
              return NestedScrollView(
                headerSliverBuilder: (context, innerBoxScrolled) {
                  return [
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Apa kabar hari ini ?',
                                style: CustomTextStyle.titleLarge.copyWith(
                                  fontSize: 16.sp,
                                ),
                              ),

                              SizedBox(
                                height: 4.h,
                              ),

                              /// header text 2
                              Text(
                                'Temukan restaurant favoritmu disini !',
                                style: CustomTextStyle.titleMedium.copyWith(
                                  fontSize: 14.sp,
                                  color: Colors.grey.withOpacity(.7),
                                ),
                              ),

                              SizedBox(
                                height: 6.h,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    /// FORM FILTER
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: HeaderPersistent(
                        maxHeight: 30.h,
                        minHeight: 28.h,
                        child: Container(
                          color: Colors.white,
                          child: formFieldWidget(
                            context: context,
                            readOnly: true,
                            borderRadius: 40,
                            formColor: Colors.white,
                            hintText: 'Cari Resto',
                            onTap: () {},
                          ),
                        ),
                      ),
                    ),
                  ];
                },
                body: restaurantsProvider.loadingGetListRestaurants ==
                            StateOfConnection.doNothing ||
                        restaurantsProvider.loadingGetListRestaurants ==
                            StateOfConnection.waiting
                    ? ListView.builder(
                        itemCount: 10,
                        padding: EdgeInsets.only(
                          bottom: 4.h,
                          top: 4.h,
                        ),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return listRestaurantsShimmerWidget();
                        })
                    : restaurantsProvider.loadingGetListRestaurants ==
                            StateOfConnection.failed
                        ? _buildRefreshWidget(
                            onTap: () async {
                              await restaurantsProvider.getListRestaurants();
                            },
                          )
                        : RefreshIndicator(
                            color: MyColors.primary600,
                            onRefresh: () async {
                              await restaurantsProvider.getListRestaurants();
                            },
                            child: ListView.builder(
                              padding: EdgeInsets.only(
                                bottom: 4.h,
                                top: 4.h,
                              ),
                              shrinkWrap: true,
                              itemCount: restaurantsProvider
                                  .listRestaurantsData?.length,
                              itemBuilder: (context, index) {
                                var data = restaurantsProvider
                                    .listRestaurantsData?[index];
                                return restaurantsCardWidget(
                                  context: context,
                                  restoName: data?.name ?? '-',
                                  restoCityLocation: data?.city ?? '-',
                                  restoDescription: data?.description ?? '-',
                                  restoRanting: '${data?.rating ?? 0}',
                                  restoImageUrl: restaurantsProvider
                                      .restaurantsPictureUrl(data?.pictureId),
                                  onTap: () {},
                                );
                              },
                            ),
                          ),
              );
            },
          ),
        ),
      ),
    );
  }

  /// ERROR REFRESH WIDGET
  Widget _buildRefreshWidget({
    Function()? onTap,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Oops, something went wrong',
          style: CustomTextStyle.titleMedium.copyWith(
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
                style: CustomTextStyle.titleMedium.copyWith(
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
}
