import 'package:fluttter_fundamental_submission_2/src/core/error/dio_exception_handler.dart';
import 'package:fluttter_fundamental_submission_2/src/core/injector/injection.dart';
import 'package:fluttter_fundamental_submission_2/src/core/request/remote/constants_base_url.dart';
import 'package:fluttter_fundamental_submission_2/src/core/request/remote/dio_request.dart';
import 'package:fluttter_fundamental_submission_2/src/core/routes/go_route_config.dart';
import 'package:fluttter_fundamental_submission_2/src/core/utils/constants.dart';
import 'package:fluttter_fundamental_submission_2/src/core/utils/helper.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/data/datasource/restaurants_remote_datasource.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/data/repository_impl/restaurants_repository_impl.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/repository/restaurants_repository.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/usecase/get_detail_resto_usecase.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/usecase/get_list_restaurants_usecase.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/usecase/post_review_usecase.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/usecase/search_restaurants_usecase.dart';
import 'package:injectable/injectable.dart';

@module
abstract class InjectionModule {
  @singleton
  Constants get constants => Constants();

  @singleton
  GoRouteConfig get routeConfig => GoRouteConfig();

  @singleton
  ConstantsBaseUrl get constantsBaseUrl => ConstantsBaseUrl();

  @lazySingleton
  DioExceptionHandler get dioExceptionHandler;

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

  @lazySingleton
  PostReviewUsecase get postReviewUsecase;

  @lazySingleton
  Helper get helper;
}
