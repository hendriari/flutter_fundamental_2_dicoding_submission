import 'package:dio/dio.dart';
import 'package:fluttter_fundamental_submission_2/src/core/error/exception.dart';
import 'package:fluttter_fundamental_submission_2/src/core/request/remote/constants_base_url.dart';
import 'package:fluttter_fundamental_submission_2/src/core/request/remote/dio_request.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/data/model/detaill_restaurants/detail_restaurants_model.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/data/model/restaurants/restaurants_model.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/data/model/restaurants_review/restaurants_review_model.dart';
import 'package:injectable/injectable.dart';

abstract class RestaurantsRemoteDatasource {
  Future<List<RestaurantsModel>?> getListRestaurants();

  Future<DetailRestaurantsModel?> getDetailRestaurants(String? id);

  Future<List<RestaurantsModel>?> searchRestaurants(String query);

  Future<List<RestaurantsReviewModel>?> postReview(
      String id, String reviewerName, String description);
}

@injectable
class RestaurantsRemoteDatasourceImpl extends RestaurantsRemoteDatasource {
  final DioRequest _dioRequest;
  final ConstantsBaseUrl _constantsBaseUrl;

  RestaurantsRemoteDatasourceImpl(this._dioRequest, this._constantsBaseUrl);

  @override
  Future<List<RestaurantsModel>?> getListRestaurants() async {
    try {
      Response? res =
          await _dioRequest.get(url: _constantsBaseUrl.listRestaurants);

      return (res?.data['restaurants'] as List)
          .map((e) => RestaurantsModel.fromJson(e))
          .toList();
    } catch (e) {
      if (e is ConnectionException) {
        throw const ConnectionException(
            message: 'No internet connection, please try again.');
      } else if (e is ServerException) {
        throw ServerException(message: e.toString());
      } else if (e is GeneralException) {
        throw GeneralException(message: e.toString());
      } else {
        throw GeneralException(message: e.toString());
      }
    }
  }

  @override
  Future<DetailRestaurantsModel?> getDetailRestaurants(String? id) async {
    try {
      Response? res =
          await _dioRequest.get(url: _constantsBaseUrl.detailRestaurants(id));

      return DetailRestaurantsModel.fromJson(res?.data['restaurant']);
    } catch (e) {
      if (e is ConnectionException) {
        throw const ConnectionException(
            message: 'No internet connection, please try again.');
      } else if (e is ServerException) {
        throw ServerException(message: e.toString());
      } else if (e is GeneralException) {
        throw GeneralException(message: e.toString());
      } else {
        throw GeneralException(message: e.toString());
      }
    }
  }

  @override
  Future<List<RestaurantsModel>?> searchRestaurants(String query) async {
    try {
      Response? res = await _dioRequest.get(
          url: _constantsBaseUrl.searchRestaurants(query));

      return (res?.data['restaurants'] as List)
          .map((e) => RestaurantsModel.fromJson(e))
          .toList();
    } catch (e) {
      if (e is ConnectionException) {
        throw const ConnectionException(
            message: 'No internet connection, please try again.');
      } else if (e is ServerException) {
        throw ServerException(message: e.toString());
      } else if (e is GeneralException) {
        throw GeneralException(message: e.toString());
      } else {
        throw GeneralException(message: e.toString());
      }
    }
  }

  @override
  Future<List<RestaurantsReviewModel>?> postReview(
      String id, String reviewerName, String description) async {
    try {
      Response? res = await _dioRequest.post(
        url: _constantsBaseUrl.postReview,
        body: {
          "id": id,
          "name": reviewerName,
          "review": description,
        },
      );

      return (res?.data['customerReviews'] as List)
          .map((e) => RestaurantsReviewModel.fromJson(e))
          .toList();
    } catch (e) {
      if (e is ConnectionException) {
        throw const ConnectionException(
            message: 'No internet connection, please try again.');
      } else if (e is ServerException) {
        throw ServerException(message: e.toString());
      } else if (e is GeneralException) {
        throw GeneralException(message: e.toString());
      } else {
        throw GeneralException(message: e.toString());
      }
    }
  }
}
