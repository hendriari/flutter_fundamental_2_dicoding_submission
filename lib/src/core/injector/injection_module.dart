import 'package:fluttter_fundamental_submission_2/src/core/injector/injection.dart';
import 'package:fluttter_fundamental_submission_2/src/core/request/remote/constants_base_url.dart';
import 'package:fluttter_fundamental_submission_2/src/core/request/remote/dio_request.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/data/datasource/restaurants_remote_datasource.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/data/repository_impl/restaurants_repository_impl.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/repository/restaurants_repository.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/usecase/get_detail_resto_usecase.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/usecase/get_list_restaurants_usecase.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/usecase/search_restaurants_usecase.dart';
import 'package:injectable/injectable.dart';

@module
abstract class InjectionModule {
  @singleton
  ConstantsBaseUrl get constantsBaseUrl => ConstantsBaseUrl();

  @singleton
  @Named('headers')
  Map<String, dynamic> get headers => {
        'Content-Type': 'application/json',
      };

  @lazySingleton
  RestaurantsRemoteDatasource get restaurantsRemoteDatasource =>
      RestaurantsRemoteDatasourceImpl(
        getIt<DioRequest>(),
        getIt<ConstantsBaseUrl>(),
      );

  @lazySingleton
  RestaurantsRepository get restaurantsRepository =>
      RestaurantsRepositoryImpl(getIt<RestaurantsRemoteDatasource>());

  @lazySingleton
  GetListRestaurantsUsecase get getListRestaurantsUsecase;

  @lazySingleton
  GetDetailRestaurantsUsecase get getDetailRestoUsecase;

  @lazySingleton
  SearchRestaurantsUsecase get searchRestaurantsUsecase;
}
