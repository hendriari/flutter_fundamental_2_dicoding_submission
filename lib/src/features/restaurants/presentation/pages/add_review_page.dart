import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttter_fundamental_submission_2/src/core/utils/enums.dart';
import 'package:fluttter_fundamental_submission_2/src/core/utils/helper.dart';
import 'package:fluttter_fundamental_submission_2/src/core/utils/hex_color.dart';
import 'package:fluttter_fundamental_submission_2/src/core/utils/my_colors.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/presentation/viewmodel/restaurants_viewmodel.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/presentation/widget/form_field_widget.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/presentation/widget/image_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AddReviewPage extends StatefulWidget {
  // final String? restaurantId;

  const AddReviewPage({
    super.key,
    // required this.restaurantId,
  });

  @override
  State<AddReviewPage> createState() => _AddReviewPageState();
}

class _AddReviewPageState extends State<AddReviewPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  late Helper _helper;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  void initState() {
    _helper = Helper();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          'Review Restaurants',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: MyColors.primary500,
          ),
        ),
        foregroundColor: MyColors.primary500,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: 10.h,
          bottom: 10.h,
          left: 8.w,
          right: 8.w,
        ),
        child: Form(
          key: _key,
          child: Column(
            children: [
              /// RESTAURANT SELECTED
              Consumer<RestaurantsViewModel>(
                builder: (context, restaurantsProvider, child) {
                  return Container(
                    padding: EdgeInsets.only(
                      left: 8.w,
                      right: 8.w,
                      top: 8.h,
                      bottom: 8.h,
                    ),
                    margin: EdgeInsets.only(
                      bottom: 20.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 3,
                          offset: Offset(1, 3),
                        )
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        /// IMAGE RESTAURANTS
                        ImageWidget(
                          imageUrl: restaurantsProvider
                                      .detailRestaurants?.pictureId !=
                                  null
                              ? restaurantsProvider.restaurantsPictureUrl(
                                  restaurantsProvider
                                      .detailRestaurants?.pictureId)
                              : null,
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
                                restaurantsProvider.detailRestaurants?.name ??
                                    '-',
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
                                  Expanded(
                                    child: Text(
                                      '${restaurantsProvider.detailRestaurants?.address ?? '-'}, ${restaurantsProvider.detailRestaurants?.city ?? '-'}',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(
                                height: 6.h,
                              ),

                              /// resto description
                              Text(
                                restaurantsProvider
                                        .detailRestaurants?.description ??
                                    '-',
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
                  );
                },
              ),

              /// REVIEWER NAME
              formFieldWidget(
                context: context,
                hintText: 'Reviewer Name',
                controller: _nameController,
                formColor: Colors.white,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'form must be filled in!';
                  }
                  return null;
                },
              ),

              SizedBox(
                height: 10.h,
              ),

              /// DESCRIPTION
              formFieldWidget(
                context: context,
                hintText: 'Description',
                controller: _descriptionController,
                formColor: Colors.white,
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'form must be filled in!';
                  }
                  return null;
                },
              ),

              SizedBox(
                height: 30.h,
              ),

              /// SUBMIT
              Consumer<RestaurantsViewModel>(
                builder: (context, restaurantsProvider, child) {
                  return ElevatedButton(
                    onPressed: () async {
                      if (_key.currentState!.validate()) {
                        if (restaurantsProvider.detailRestaurants?.id != null) {
                          await restaurantsProvider.postReview(
                              restaurantsId:
                                  restaurantsProvider.detailRestaurants!.id!,
                              reviewerName: _nameController.text.trim(),
                              description: _descriptionController.text.trim(),
                              onSuccess: () {
                                _descriptionController.clear();
                                _nameController.clear();
                                _helper.showToast(
                                    message: 'Success post review!');
                                Future.delayed(
                                  const Duration(milliseconds: 500),
                                  () => context.pop(),
                                );
                              },
                              onError: (error) {
                                _helper.showToast(
                                  message: error ?? 'something error',
                                  backgroundColor: HexColor('8b0000'),
                                  textColor: Colors.white,
                                );
                              });
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: MyColors.primary500,
                          width: 1,
                        ),
                      ),
                      minimumSize: Size(
                        double.infinity,
                        35.h,
                      ),
                      maximumSize: Size(
                        double.infinity,
                        35.h,
                      ),
                    ),
                    child: restaurantsProvider.loadingPostReview ==
                            StateOfConnection.waiting
                        ? SpinKitThreeBounce(
                            color: Colors.black,
                            size: 14.sp,
                          )
                        : Text(
                            'Submit',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
