// import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/entities/detail_restaurants.dart';
// import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/entities/restaurants_category.dart';
// import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/entities/restaurants_menu.dart';
// import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/entities/restaurants_review.dart';
// import 'package:json_annotation/json_annotation.dart';
//
// part 'detail_restaurants_model.g.dart';
//
// @JsonSerializable()
// class DetailRestaurantsModel extends DetailRestaurants {
//   @JsonKey(name: 'categories')
//   List<RestaurantsCategory>? listCategoryModel;
//
//   @JsonKey(name: 'menus')
//   RestaurantsMenu? restaurantsMenuModel;
//
//   @JsonKey(name: 'customerReviews')
//   List<RestaurantsReview>? listReviewModel;
//
//   DetailRestaurantsModel({
//     super.id,
//     super.name,
//     super.description,
//     super.pictureId,
//     super.city,
//     super.rating,
//     this.listCategoryModel,
//     this.restaurantsMenuModel,
//     this.listReviewModel,
//   }) : super(
//           listReview: listReviewModel,
//           listCategory: listCategoryModel,
//           restaurantsMenu: restaurantsMenuModel,
//         );
// }
