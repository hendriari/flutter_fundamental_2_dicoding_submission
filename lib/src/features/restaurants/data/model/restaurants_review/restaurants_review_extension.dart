import 'package:fluttter_fundamental_submission_2/src/features/restaurants/data/model/restaurants_review/restaurants_review_model.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/entities/restaurants_review.dart';

extension RestaurantsReviewToModel on RestaurantsReview {
  RestaurantsReviewModel toModel() => RestaurantsReviewModel(
        name: name,
        review: review,
        date: date,
      );
}
