import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/entities/restaurants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'restaurants_model.g.dart';

@JsonSerializable()
class RestaurantsModel extends Restaurants {
  RestaurantsModel({
    super.id,
    super.name,
    super.description,
    super.pictureId,
    super.city,
    super.rating,
  });

  factory RestaurantsModel.fromJson(Map<String, dynamic> json) => _$RestaurantsModelFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantsModelToJson(this);

}
