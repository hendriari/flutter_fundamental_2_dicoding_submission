import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/entities/restaurants_review.dart';
import 'package:json_annotation/json_annotation.dart';

part 'restaurants_review_model.g.dart';

@JsonSerializable()
class RestaurantsReviewModel extends RestaurantsReview {
  RestaurantsReviewModel({
    super.name,
    super.review,
    super.date,
  });

  factory RestaurantsReviewModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantsReviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantsReviewModelToJson(this);
}
