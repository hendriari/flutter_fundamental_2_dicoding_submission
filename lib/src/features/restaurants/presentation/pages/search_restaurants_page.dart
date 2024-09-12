import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttter_fundamental_submission_2/src/core/utils/enums.dart';
import 'package:fluttter_fundamental_submission_2/src/core/utils/helper.dart';
import 'package:fluttter_fundamental_submission_2/src/core/utils/hex_color.dart';
import 'package:fluttter_fundamental_submission_2/src/core/utils/my_colors.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/presentation/viewmodel/restaurants_viewmodel.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/presentation/widget/form_field_widget.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/presentation/widget/refresh_widget.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/presentation/widget/restaurants_widget/restaurants_card_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SearchRestaurantsPage extends StatefulWidget {
  const SearchRestaurantsPage({super.key});

  @override
  State<SearchRestaurantsPage> createState() => _SearchRestaurantsPageState();
}

class _SearchRestaurantsPageState extends State<SearchRestaurantsPage> {
  final TextEditingController _searchController = TextEditingController();
  late RestaurantsViewModel _restaurantsViewModel;
  late Helper _helper;

  @override
  void initState() {
    _helper = Helper();
    _restaurantsViewModel =
        Provider.of<RestaurantsViewModel>(context, listen: false);
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (pop) {
        _restaurantsViewModel.clearTempSearchRestaurants();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Search Restaurants',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: MyColors.primary500,
            ),
          ),
          foregroundColor: MyColors.primary500,
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
        ),
        body: Padding(
          padding: EdgeInsets.only(
            left: 8.w,
            right: 8.w,
            top: 10.h,
            bottom: 10.h,
          ),
          child: Column(
            children: [
              /// SEARCH CONTROLLER
              formFieldWidget(
                context: context,
                hintText: 'Search..',
                controller: _searchController,
                textInputAction: TextInputAction.done,
                formColor: Colors.white,
                onEditingComplete: () async {
                  FocusScope.of(context).requestFocus(FocusNode());
                  await _restaurantsViewModel.searchRestaurants(
                    query: _searchController.text.trim(),
                    onError: (error) {
                      _helper.showToast(
                        message: error ?? 'something error',
                        backgroundColor: HexColor('8b0000'),
                        textColor: Colors.white,
                      );
                    },
                  );
                },
              ),

              SizedBox(
                height: 10.h,
              ),

              /// SEARCH RESULT
              Expanded(
                child: Consumer<RestaurantsViewModel>(
                  builder: (context, restaurantsProvider, c) {
                    return restaurantsProvider.loadingSearchRestaurants ==
                            StateOfConnection.doNothing
                        ? const SizedBox()
                        : restaurantsProvider.loadingSearchRestaurants ==
                                StateOfConnection.waiting
                            ? Center(
                                child: SpinKitThreeBounce(
                                  color: MyColors.primary500,
                                  size: 14.sp,
                                ),
                              )
                            : restaurantsProvider.loadingSearchRestaurants ==
                                    StateOfConnection.failed
                                ? refreshWidget(
                                    textInfo:
                                        'Something wrong, please try again',
                                    onTap: () async {
                                      await restaurantsProvider
                                          .searchRestaurants(
                                        query: _searchController.text.trim(),
                                        onError: (error) {
                                          _helper.showToast(
                                            message: error ?? 'something error',
                                            backgroundColor: HexColor('8b0000'),
                                            textColor: Colors.white,
                                          );
                                        },
                                      );
                                    },
                                  )
                                : restaurantsProvider
                                                .listResultSearchRestaurants ==
                                            null ||
                                        restaurantsProvider
                                            .listResultSearchRestaurants!
                                            .isEmpty
                                    ? Center(
                                        child: Text(
                                          'Restaurant not found',
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      )
                                    : ListView.builder(
                                        itemCount: restaurantsProvider
                                            .listResultSearchRestaurants
                                            ?.length,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          var data = restaurantsProvider
                                                  .listResultSearchRestaurants?[
                                              index];
                                          return restaurantsCardWidget(
                                            context: context,
                                            restoName: data?.name ?? '-',
                                            restoCityLocation:
                                                data?.city ?? '-',
                                            restoDescription:
                                                data?.description ?? '-',
                                            restoRanting:
                                                '${data?.rating ?? 0}',
                                            restoImageUrl: restaurantsProvider
                                                .restaurantsPictureUrl(
                                                    data?.pictureId),
                                            onTap: () {
                                              if (data?.id != null) {
                                                context.push(
                                                  '/restaurants/restaurants-detail/${data!.id!}',
                                                );
                                              } else {
                                                _helper.showToast(
                                                  message:
                                                      'Sorry, there was an error when retrieving restaurant data',
                                                  backgroundColor:
                                                      HexColor('8b0000'),
                                                  textColor: Colors.white,
                                                );
                                              }
                                            },
                                          );
                                        });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
