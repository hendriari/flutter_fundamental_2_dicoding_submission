import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/entities/restaurants_beverage.dart';
import 'package:json_annotation/json_annotation.dart';

part 'restaurants_beverage_model.g.dart';

@JsonSerializable()
class RestaurantsBeverageModel extends RestaurantsBeverage {
  RestaurantsBeverageModel({super.name});

  factory RestaurantsBeverageModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantsBeverageModelFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantsBeverageModelToJson(this);
}
