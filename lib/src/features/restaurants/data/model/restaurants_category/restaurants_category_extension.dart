import 'package:fluttter_fundamental_submission_2/src/features/restaurants/data/model/restaurants_category/restaurants_category_model.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/entities/restaurants_category.dart';

extension RestaurantsCategoryToModel on RestaurantsCategory {
  RestaurantsCategoryModel toModel() => RestaurantsCategoryModel(name: name);
}
