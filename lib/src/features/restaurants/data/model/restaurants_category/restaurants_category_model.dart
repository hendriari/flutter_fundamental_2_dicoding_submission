import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/entities/restaurants_category.dart';
import 'package:json_annotation/json_annotation.dart';

part 'restaurants_category_model.g.dart';

@JsonSerializable()
class RestaurantsCategoryModel extends RestaurantsCategory {
  RestaurantsCategoryModel({super.name});

  factory RestaurantsCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantsCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantsCategoryModelToJson(this);
}
