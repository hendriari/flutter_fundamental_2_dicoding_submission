// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_restaurants_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailRestaurantsModel _$DetailRestaurantsModelFromJson(
        Map<String, dynamic> json) =>
    DetailRestaurantsModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      pictureId: json['pictureId'] as String?,
      city: json['city'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      listCategoryModel: DetailRestaurantsModel._restaurantsCategoryFromJson(
          json['categories'] as List?),
      restaurantsMenuModel: DetailRestaurantsModel._restaurantsMenuFromJson(
          json['menus'] as Map<String, dynamic>),
      listReviewModel: DetailRestaurantsModel._customerReviewFromJson(
          json['customerReviews'] as List?),
    );

Map<String, dynamic> _$DetailRestaurantsModelToJson(
        DetailRestaurantsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'pictureId': instance.pictureId,
      'city': instance.city,
      'rating': instance.rating,
      'categories': DetailRestaurantsModel._restaurantsCategoryToJson(
          instance.listCategoryModel),
      'menus': DetailRestaurantsModel._restaurantsMenuToJson(
          instance.restaurantsMenuModel),
      'customerReviews': DetailRestaurantsModel._customerReviewToJson(
          instance.listReviewModel),
    };
