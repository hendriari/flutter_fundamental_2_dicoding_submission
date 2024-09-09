import 'package:fluttter_fundamental_submission_2/src/features/restaurants/data/model/restaurants_beverage/restaurants_beverage_model.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/entities/restaurants_menu.dart';
import 'package:json_annotation/json_annotation.dart';

part 'restaurants_menu_model.g.dart';

@JsonSerializable()
class RestaurantsMenuModel extends RestaurantsMenu {
  @JsonKey(
      fromJson: _restaurantsBeverageFromJson,
      toJson: _restaurantsBeverageToJson,
      name: 'foods')
  final List<RestaurantsBeverageModel>? foods;

  @JsonKey(
      fromJson: _restaurantsBeverageFromJson,
      toJson: _restaurantsBeverageToJson,
      name: 'drinks')
  final List<RestaurantsBeverageModel>? drinks;

  RestaurantsMenuModel({
    this.foods,
    this.drinks,
  }) : super(
    listFoods: foods,
    listDrinks: drinks,
  );

  factory RestaurantsMenuModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantsMenuModelFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantsMenuModelToJson(this);

  static List<RestaurantsBeverageModel>? _restaurantsBeverageFromJson(
      List<dynamic>? json) {
    if (json != null) {
      return json
          .map((e) =>
          RestaurantsBeverageModel.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return null;
  }

  static List<Map<String, dynamic>> _restaurantsBeverageToJson(
      List<RestaurantsBeverageModel>? beverage) =>
      beverage?.map((e) => e.toJson()).toList() ?? [];
}