import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttter_fundamental_submission_2/src/core/injector/injection.dart';
import 'package:fluttter_fundamental_submission_2/src/core/utils/enums.dart';
import 'package:fluttter_fundamental_submission_2/src/core/utils/helper.dart';
import 'package:fluttter_fundamental_submission_2/src/core/utils/hex_color.dart';
import 'package:fluttter_fundamental_submission_2/src/core/utils/my_colors.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/presentation/viewmodel/restaurants_viewmodel.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/presentation/widget/form_field_widget.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/presentation/widget/header_presistent.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/presentation/widget/refresh_widget.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/presentation/widget/restaurants_widget/list_restaurants_shimmer_widget.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/presentation/widget/restaurants_widget/restaurants_card_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ListRestaurantsPage extends StatefulWidget {
  const ListRestaurantsPage({super.key});

  @override
  State<ListRestaurantsPage> createState() => _ListRestaurantsPageState();
}

class _ListRestaurantsPageState extends State<ListRestaurantsPage> {
  late Helper _helper;

  @override
  void initState() {
    _helper = getIt<Helper>();
    final restaurants =
        Provider.of<RestaurantsViewModel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await restaurants.getListRestaurants(
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
                                'How are you today ?',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              SizedBox(
                                height: 4.h,
                              ),

                              /// header text 2
                              Text(
                                'Find your favorite restaurant here!',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.grey,
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
                        maxHeight: 35.h,
                        minHeight: 34.h,
                        child: Container(
                          color: Colors.white,
                          child: formFieldWidget(
                            context: context,
                            readOnly: true,
                            borderRadius: 40,
                            formColor: Colors.white,
                            hintText: 'Search Restaurants',
                            onTap: () => context.goNamed('search-restaurants'),
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
                        ? refreshWidget(
                            textInfo: 'Oops, something went wrong',
                            onTap: () async {
                              await restaurantsProvider.getListRestaurants();
                            },
                          )
                        : restaurantsProvider.listRestaurantsData == null ||
                                restaurantsProvider.listRestaurantsData!.isEmpty
                            ? refreshWidget(
                                textInfo: 'Restaurant data not available',
                                onTap: () async {
                                  await restaurantsProvider
                                      .getListRestaurants();
                                },
                              )
                            : RefreshIndicator(
                                color: MyColors.primary600,
                                onRefresh: () async {
                                  await restaurantsProvider
                                      .getListRestaurants();
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
                                      restoDescription:
                                          data?.description ?? '-',
                                      restoRanting: '${data?.rating ?? 0}',
                                      restoImageUrl: restaurantsProvider
                                          .restaurantsPictureUrl(
                                              data?.pictureId),
                                      onTap: () {
                                        if (data?.id != null) {
                                          context.goNamed('restaurants-detail',
                                              pathParameters: {
                                                'id': data!.id!
                                              });
                                        } else {
                                          _helper.showToast(
                                            message:
                                                'Sorry, there was an error when retrieving restaurant data',
                                            backgroundColor: HexColor('8b0000'),
                                            textColor: Colors.white,
                                          );
                                        }
                                      },
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
}
