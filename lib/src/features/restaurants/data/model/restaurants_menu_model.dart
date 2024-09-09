import 'package:fluttter_fundamental_submission_2/src/features/restaurants/data/model/beverage_model.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/entities/beverage.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/entities/restaurants_menu.dart';
import 'package:json_annotation/json_annotation.dart';

part 'restaurants_menu_model.g.dart';

@JsonSerializable()
class RestaurantsMenuModel extends RestaurantsMenu {


  @JsonKey(fromJson: _beverageFromJson, toJson: _beverageToJson, name: 'foods')
  List<Beverage>? listFoods;

  @JsonKey(fromJson: _beverageFromJson, toJson: _beverageToJson, name: 'drinks')
  List<Beverage>? listDrinks;

  RestaurantsMenuModel({
    this.listFoods,
    this.listDrinks,
  }) : super(
          foods: listFoods,
          drinks: listDrinks,
        );

  factory RestaurantsMenuModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantsMenuModelFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantsMenuModelToJson(this);

  static List<Beverage>? _beverageFromJson(List<dynamic>? json) => json
      ?.map((e) => BeverageModel.fromJson(e as Map<String, dynamic>))
      .toList();

  static List<Map<String, dynamic>?> _beverageToJson(
          List<Beverage>? beverage) =>
      beverage?.map((e) => (e as BeverageModel).toJson()).toList() ?? [];
}
