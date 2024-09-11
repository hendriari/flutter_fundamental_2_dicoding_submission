import 'package:fluttter_fundamental_submission_2/src/features/restaurants/data/model/restaurants_category/restaurants_category_model.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/data/model/restaurants_menu/restaurants_menu_extension.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/data/model/restaurants_menu/restaurants_menu_model.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/data/model/restaurants_review/restaurants_review_model.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/entities/detail_restaurants.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/entities/restaurants_category.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/entities/restaurants_menu.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/entities/restaurants_review.dart';
import 'package:json_annotation/json_annotation.dart';

part 'detail_restaurants_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DetailRestaurantsModel extends DetailRestaurants {
  @JsonKey(
      fromJson: _restaurantsCategoryFromJson,
      toJson: _restaurantsCategoryToJson,
      name: 'categories')
  final List<RestaurantsCategory>? listCategoryModel;

  @JsonKey(
      name: 'menus',
      fromJson: _restaurantsMenuFromJson,
      toJson: _restaurantsMenuToJson)
  RestaurantsMenu? restaurantsMenuModel;

  @JsonKey(
      fromJson: _customerReviewFromJson,
      toJson: _customerReviewToJson,
      name: 'customerReviews')
  final List<RestaurantsReview>? listReviewModel;

  DetailRestaurantsModel({
    super.id,
    super.name,
    super.description,
    super.pictureId,
    super.city,
    super.rating,
    super.address,
    this.restaurantsMenuModel,
    this.listCategoryModel,
    this.listReviewModel,
  }) : super(
          listReview: listReviewModel,
          listCategory: listCategoryModel,
          restaurantsMenu: restaurantsMenuModel,
        );

  factory DetailRestaurantsModel.fromJson(Map<String, dynamic> json) =>
      _$DetailRestaurantsModelFromJson(json);

  Map<String, dynamic> toJson() => _$DetailRestaurantsModelToJson(this);

  static List<RestaurantsCategory>? _restaurantsCategoryFromJson(
          List<dynamic>? json) =>
      json
          ?.map((e) =>
              RestaurantsCategoryModel.fromJson(e as Map<String, dynamic>))
          .toList();

  static List<Map<String, dynamic>>? _restaurantsCategoryToJson(
          List<RestaurantsCategory>? data) =>
      data?.map((e) => (e as RestaurantsCategoryModel).toJson()).toList();

  static List<RestaurantsReview>? _customerReviewFromJson(
          List<dynamic>? json) =>
      json
          ?.map(
              (e) => RestaurantsReviewModel.fromJson(e as Map<String, dynamic>))
          .toList();

  static List<Map<String, dynamic>>? _customerReviewToJson(
          List<RestaurantsReview>? data) =>
      data?.map((e) => (e as RestaurantsReviewModel).toJson()).toList();

  static RestaurantsMenu? _restaurantsMenuFromJson(
          Map<String, dynamic>? json) =>
      json != null ? RestaurantsMenuModel.fromJson(json) : null;

  static Map<String, dynamic>? _restaurantsMenuToJson(RestaurantsMenu? data) =>
      data?.toModel().toJson();
}
