import 'package:fluttter_fundamental_submission_2/src/core/error/failure.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/entities/detail_restaurants.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/entities/restaurants.dart';
import 'package:dartz/dartz.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/entities/restaurants_review.dart';

abstract class RestaurantsRepository {
  Future<Either<Failure, List<Restaurants>?>> getListRestaurants();

  Future<Either<Failure, DetailRestaurants?>> getDetailRestaurants(String? id);

  Future<Either<Failure, List<Restaurants>?>> searchRestaurants(String query);

  Future<Either<Failure, List<RestaurantsReview>?>> postReview(
      String id, String reviewerName, String description);
}
