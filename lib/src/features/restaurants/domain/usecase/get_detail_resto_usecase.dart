import 'package:dartz/dartz.dart';
import 'package:fluttter_fundamental_submission_2/src/core/error/failure.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/entities/detail_restaurants.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/repository/restaurants_repository.dart';

class GetDetailRestaurantsUsecase {
  final RestaurantsRepository _restaurantsRepository;

  GetDetailRestaurantsUsecase(this._restaurantsRepository);

  Future<Either<Failure, DetailRestaurants?>> execute(String? id) async =>
      await _restaurantsRepository.getDetailRestaurants(id);
}
