import 'package:dartz/dartz.dart';
import 'package:fluttter_fundamental_submission_2/src/core/error/failure.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/entities/restaurants_review.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/repository/restaurants_repository.dart';

class PostReviewUsecase {
  final RestaurantsRepository _restaurantsRepository;

  PostReviewUsecase(this._restaurantsRepository);

  Future<Either<Failure, List<RestaurantsReview>?>> execute(
          String id, String reviewerName, String description) async =>
      await _restaurantsRepository.postReview(id, reviewerName, description);
}
