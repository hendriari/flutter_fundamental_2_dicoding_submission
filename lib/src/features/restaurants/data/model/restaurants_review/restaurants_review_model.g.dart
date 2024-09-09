// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurants_review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantsReviewModel _$RestaurantsReviewModelFromJson(
        Map<String, dynamic> json) =>
    RestaurantsReviewModel(
      name: json['name'] as String?,
      review: json['review'] as String?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$RestaurantsReviewModelToJson(
        RestaurantsReviewModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'review': instance.review,
      'date': instance.date,
    };
