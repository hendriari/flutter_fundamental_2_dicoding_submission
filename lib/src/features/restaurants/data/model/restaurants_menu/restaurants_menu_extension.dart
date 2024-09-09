import 'package:fluttter_fundamental_submission_2/src/features/restaurants/data/model/restaurants_beverage/restaurants_beverage_extension.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/data/model/restaurants_menu/restaurants_menu_model.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/entities/restaurants_menu.dart';

extension RestaurantsMenuToModel on RestaurantsMenu {
  RestaurantsMenuModel toModel() => RestaurantsMenuModel(
        foods: listFoods?.map((e) => e.toModel()).toList(),
        drinks: listDrinks?.map((e) => e.toModel()).toList(),
      );
}
