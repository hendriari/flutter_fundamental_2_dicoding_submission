import 'package:dartz/dartz.dart';
import 'package:fluttter_fundamental_submission_2/src/core/error/exception.dart';
import 'package:fluttter_fundamental_submission_2/src/core/error/failure.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/data/datasource/restaurants_remote_datasource.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/entities/detail_restaurants.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/entities/restaurants.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/repository/restaurants_repository.dart';

class RestaurantsRepositoryImpl extends RestaurantsRepository {
  final RestaurantsRemoteDatasource _remoteDatasource;

  RestaurantsRepositoryImpl(this._remoteDatasource);

  @override
  Future<Either<Failure, List<Restaurants>?>> getListRestaurants() async {
    try {
      List<Restaurants>? data = await _remoteDatasource.getListRestaurants();

      return Right(data);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(message: e.toString()),
      );
    } on ConnectionException catch (e) {
      return Left(
        ConnectionFailure(message: e.toString()),
      );
    } on GeneralException catch (e) {
      return Left(
        GeneralFailure(message: e.toString()),
      );
    } catch (e) {
      return Left(
        GeneralFailure(message: e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, DetailRestaurants?>> getDetailRestaurants(
      String? id) async {
    try {
      DetailRestaurants? data =
          await _remoteDatasource.getDetailRestaurants(id);

      return Right(data);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(message: e.toString()),
      );
    } on ConnectionException catch (e) {
      return Left(
        ConnectionFailure(message: e.toString()),
      );
    } on GeneralException catch (e) {
      return Left(
        GeneralFailure(message: e.toString()),
      );
    } catch (e) {
      return Left(
        GeneralFailure(message: e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, List<Restaurants>?>> searchRestaurants(
      String query) async {
    try {
      List<Restaurants>? data =
          await _remoteDatasource.searchRestaurants(query);

      return Right(data);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(message: e.toString()),
      );
    } on ConnectionException catch (e) {
      return Left(
        ConnectionFailure(message: e.toString()),
      );
    } on GeneralException catch (e) {
      return Left(
        GeneralFailure(message: e.toString()),
      );
    } catch (e) {
      return Left(
        GeneralFailure(message: e.toString()),
      );
    }
  }
}
