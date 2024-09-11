import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttter_fundamental_submission_2/src/core/error/failure.dart';
import 'package:fluttter_fundamental_submission_2/src/core/request/remote/constants_base_url.dart';
import 'package:fluttter_fundamental_submission_2/src/core/utils/enums.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/entities/detail_restaurants.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/entities/restaurants.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/entities/restaurants_review.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/usecase/get_detail_resto_usecase.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/usecase/get_list_restaurants_usecase.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/usecase/post_review_usecase.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/usecase/search_restaurants_usecase.dart';

class RestaurantsViewModel with ChangeNotifier {
  final GetListRestaurantsUsecase getListRestaurantsUsecase;
  final GetDetailRestaurantsUsecase getDetailRestaurantsUsecase;
  final SearchRestaurantsUsecase searchRestaurantsUsecase;
  final PostReviewUsecase postReviewUsecase;
  final ConstantsBaseUrl constantsBaseUrl;

  RestaurantsViewModel({
    required this.getListRestaurantsUsecase,
    required this.getDetailRestaurantsUsecase,
    required this.searchRestaurantsUsecase,
    required this.constantsBaseUrl,
    required this.postReviewUsecase,
  })  : _getListRestaurantsUsecase = getListRestaurantsUsecase,
        _getDetailRestaurantsUsecase = getDetailRestaurantsUsecase,
        _searchRestaurantsUsecase = searchRestaurantsUsecase,
        _postReviewUsecase = postReviewUsecase,
        _constantsBaseUrl = constantsBaseUrl;

  final GetListRestaurantsUsecase _getListRestaurantsUsecase;
  final GetDetailRestaurantsUsecase _getDetailRestaurantsUsecase;
  final SearchRestaurantsUsecase _searchRestaurantsUsecase;
  final PostReviewUsecase _postReviewUsecase;
  final ConstantsBaseUrl _constantsBaseUrl;

  /// RESTAURANTS PICTURE URL
  String? restaurantsPictureUrl(String? id) =>
      _constantsBaseUrl.imageMediumUrl(id);

  /// GET LIST RESTAURANTS
  List<Restaurants>? _listRestaurantsData = [];

  List<Restaurants>? get listRestaurantsData => _listRestaurantsData;

  StateOfConnection _loadingGetListRestaurants = StateOfConnection.doNothing;

  StateOfConnection get loadingGetListRestaurants => _loadingGetListRestaurants;

  Future<void> getListRestaurants({
    Function(String?)? onError,
  }) async {
    _loadingGetListRestaurants = StateOfConnection.waiting;
    notifyListeners();
    Either<Failure, List<Restaurants>?> result =
        await _getListRestaurantsUsecase.execute();
    result.fold(
      (failure) {
        if (failure is ServerFailure) {
          _loadingGetListRestaurants = StateOfConnection.failed;
          notifyListeners();
          onError?.call(failure.message);
        } else if (failure is ConnectionFailure) {
          _loadingGetListRestaurants = StateOfConnection.failed;
          notifyListeners();
          onError?.call(failure.message);
        } else if (failure is GeneralFailure) {
          _loadingGetListRestaurants = StateOfConnection.failed;
          notifyListeners();
          onError?.call(failure.message);
        } else {
          _loadingGetListRestaurants = StateOfConnection.failed;
          notifyListeners();
          onError?.call(failure.toString());
        }
      },
      (data) {
        _listRestaurantsData = data;
        _loadingGetListRestaurants = StateOfConnection.success;
        notifyListeners();
      },
    );
  }

  /// GET DETAIL RESTAURANTS
  DetailRestaurants? _detailRestaurants;

  DetailRestaurants? get detailRestaurants => _detailRestaurants;

  StateOfConnection _loadingGetDetailRestaurants = StateOfConnection.doNothing;

  StateOfConnection get loadingGetDetailRestaurants =>
      _loadingGetDetailRestaurants;

  Future<void> getDetailRestaurants({
    required String? id,
    Function(String?)? onError,
  }) async {
    _loadingGetDetailRestaurants = StateOfConnection.waiting;
    _detailRestaurants = null;
    notifyListeners();
    Either<Failure, DetailRestaurants?> result =
        await _getDetailRestaurantsUsecase.execute(id);
    result.fold(
      (failure) {
        if (failure is ServerFailure) {
          _loadingGetDetailRestaurants = StateOfConnection.failed;
          notifyListeners();
          onError?.call(failure.message);
        } else if (failure is ConnectionFailure) {
          _loadingGetDetailRestaurants = StateOfConnection.failed;
          notifyListeners();
          onError?.call(failure.message);
        } else if (failure is GeneralFailure) {
          _loadingGetDetailRestaurants = StateOfConnection.failed;
          notifyListeners();
          onError?.call(failure.message);
        } else {
          _loadingGetDetailRestaurants = StateOfConnection.failed;
          notifyListeners();
          onError?.call(failure.toString());
        }
      },
      (data) {
        _detailRestaurants = data;
        _loadingGetDetailRestaurants = StateOfConnection.success;
        notifyListeners();
      },
    );
  }

  /// SEARCH RESTAURANTS
  List<Restaurants>? _listResultSearchRestaurants = [];

  List<Restaurants>? get listResultSearchRestaurants =>
      _listResultSearchRestaurants;

  StateOfConnection _loadingSearchRestaurants = StateOfConnection.doNothing;

  StateOfConnection get loadingSearchRestaurants => _loadingSearchRestaurants;

  Future<void> searchRestaurants({
    required String query,
    Function(String?)? onError,
  }) async {
    _loadingSearchRestaurants = StateOfConnection.waiting;
    _listResultSearchRestaurants?.clear();
    notifyListeners();
    Either<Failure, List<Restaurants>?> result =
        await _searchRestaurantsUsecase.execute(query);
    result.fold(
      (failure) {
        if (failure is ServerFailure) {
          _loadingSearchRestaurants = StateOfConnection.failed;
          notifyListeners();
          onError?.call(failure.message);
        } else if (failure is ConnectionFailure) {
          _loadingSearchRestaurants = StateOfConnection.failed;
          notifyListeners();
          onError?.call(failure.message);
        } else if (failure is GeneralFailure) {
          _loadingSearchRestaurants = StateOfConnection.failed;
          notifyListeners();
          onError?.call(failure.message);
        } else {
          _loadingSearchRestaurants = StateOfConnection.failed;
          notifyListeners();
          onError?.call(failure.toString());
        }
      },
      (data) {
        _listResultSearchRestaurants = data;
        _loadingSearchRestaurants = StateOfConnection.success;
        notifyListeners();
      },
    );
  }

  /// RESTAURANTS REVIEW
  List<RestaurantsReview>? _newListReviewData = [];

  List<RestaurantsReview>? get listReviewData => _newListReviewData;

  StateOfConnection _loadingPostReview = StateOfConnection.doNothing;

  StateOfConnection get loadingPostReview => _loadingPostReview;

  Future<void> postReview({
    required String restaurantsId,
    required String reviewerName,
    required String description,
    Function()? onSuccess,
    Function(String?)? onError,
  }) async {
    _loadingPostReview = StateOfConnection.waiting;
    notifyListeners();

    Either<Failure, List<RestaurantsReview>?> result = await _postReviewUsecase
        .execute(restaurantsId, reviewerName, description);

    result.fold(
      (failure) {
        if (failure is ServerFailure) {
          _loadingSearchRestaurants = StateOfConnection.failed;
          notifyListeners();
          onError?.call(failure.message);
        } else if (failure is ConnectionFailure) {
          _loadingSearchRestaurants = StateOfConnection.failed;
          notifyListeners();
          onError?.call(failure.message);
        } else if (failure is GeneralFailure) {
          _loadingSearchRestaurants = StateOfConnection.failed;
          notifyListeners();
          onError?.call(failure.message);
        } else {
          _loadingSearchRestaurants = StateOfConnection.failed;
          notifyListeners();
          onError?.call(failure.toString());
        }
      },
      (data) {
        _newListReviewData = data;
        _loadingPostReview = StateOfConnection.success;
        onSuccess?.call();
        notifyListeners();
      },
    );
  }

  /// CLEAR TEMP DATA
  void clearTempDetailRestaurants() {
    Future.delayed(const Duration(seconds: 1), () {
      _detailRestaurants = null;
      _newListReviewData?.clear();
      notifyListeners();
    });
  }

  void clearTempSearchRestaurants() {
    Future.delayed(const Duration(seconds: 1), () {
      _listResultSearchRestaurants?.clear();
      notifyListeners();
    });
  }
}
