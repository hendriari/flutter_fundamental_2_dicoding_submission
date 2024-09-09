import 'package:dartz/dartz.dart';
import 'package:fluttter_fundamental_submission_2/src/core/error/failure.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/entities/restaurants.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/repository/restaurants_repository.dart';

class GetListRestaurantsUsecase {
  final RestaurantsRepository _restaurantsRepository;

  GetListRestaurantsUsecase(this._restaurantsRepository);

  Future<Either<Failure, List<Restaurants>?>> execute() async =>
      await _restaurantsRepository.getListRestaurants();
}
