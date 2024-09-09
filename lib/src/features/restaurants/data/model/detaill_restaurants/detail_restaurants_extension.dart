import 'package:fluttter_fundamental_submission_2/src/features/restaurants/data/model/detaill_restaurants/detail_restaurants_model.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/data/model/restaurants_category/restaurants_category_extension.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/data/model/restaurants_menu/restaurants_menu_extension.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/data/model/restaurants_review/restaurants_review_extension.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/entities/detail_restaurants.dart';

extension DetailRestaurantsToModel on DetailRestaurants {
  DetailRestaurantsModel toModel() => DetailRestaurantsModel(
        id: id,
        name: name,
        description: description,
        pictureId: pictureId,
        city: city,
        rating: rating,
        listCategoryModel: listCategory?.map((e) => e.toModel()).toList(),
        restaurantsMenuModel: restaurantsMenu?.toModel(),
        listReviewModel: listReview?.map((e) => e.toModel()).toList(),
      );
}
