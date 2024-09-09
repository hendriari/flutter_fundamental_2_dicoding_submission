import 'package:dartz/dartz.dart';
import 'package:fluttter_fundamental_submission_2/src/core/error/failure.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/entities/detail_restaurants.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/repository/restaurants_repository.dart';

class GetDetailRestoUsecase {
  final RestaurantsRepository _restaurantsRepository;

  GetDetailRestoUsecase(this._restaurantsRepository);

  Future<Either<Failure, DetailRestaurants>?> execute(String? restoId) async =>
      await _restaurantsRepository.getDetailRestaurants(restoId);
}
