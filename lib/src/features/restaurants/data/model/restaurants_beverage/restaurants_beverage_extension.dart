import 'package:fluttter_fundamental_submission_2/src/features/restaurants/data/model/restaurants_beverage/restaurants_beverage_model.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/entities/restaurants_beverage.dart';

extension RestaurantsBeverageToModel on RestaurantsBeverage {
  RestaurantsBeverageModel toModel() => RestaurantsBeverageModel(name: name);
}
