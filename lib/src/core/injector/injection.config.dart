// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:fluttter_fundamental_submission_2/src/core/injector/injection_module.dart'
    as _i887;
import 'package:fluttter_fundamental_submission_2/src/core/request/remote/constants_base_url.dart'
    as _i275;
import 'package:fluttter_fundamental_submission_2/src/core/request/remote/dio_request.dart'
    as _i961;
import 'package:fluttter_fundamental_submission_2/src/core/routes/go_route_config.dart'
    as _i185;
import 'package:fluttter_fundamental_submission_2/src/core/utils/constants.dart'
    as _i659;
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/data/datasource/restaurants_remote_datasource.dart'
    as _i559;
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/repository/restaurants_repository.dart'
    as _i679;
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/usecase/get_detail_resto_usecase.dart'
    as _i998;
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/usecase/get_list_restaurants_usecase.dart'
    as _i981;
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/usecase/post_review_usecase.dart'
    as _i144;
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/domain/usecase/search_restaurants_usecase.dart'
    as _i136;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectionModule = _$InjectionModule(this);
    gh.singleton<_i659.Constants>(() => injectionModule.constants);
    gh.singleton<_i185.GoRouteConfig>(() => injectionModule.routeConfig);
    gh.singleton<_i275.ConstantsBaseUrl>(
        () => injectionModule.constantsBaseUrl);
    gh.lazySingleton<_i559.RestaurantsRemoteDatasource>(
        () => injectionModule.restaurantsRemoteDatasource);
    gh.lazySingleton<_i679.RestaurantsRepository>(
        () => injectionModule.restaurantsRepository);
    gh.singleton<Map<String, dynamic>>(
      () => injectionModule.headers,
      instanceName: 'headers',
    );
    gh.lazySingleton<_i981.GetListRestaurantsUsecase>(
        () => injectionModule.getListRestaurantsUsecase);
    gh.lazySingleton<_i998.GetDetailRestaurantsUsecase>(
        () => injectionModule.getDetailRestoUsecase);
    gh.lazySingleton<_i136.SearchRestaurantsUsecase>(
        () => injectionModule.searchRestaurantsUsecase);
    gh.lazySingleton<_i144.PostReviewUsecase>(
        () => injectionModule.postReviewUsecase);
    gh.factory<_i961.DioRequest>(() => _i961.DioRequest(
          gh<_i275.ConstantsBaseUrl>(),
          gh<Map<String, dynamic>>(instanceName: 'headers'),
        ));
    gh.factory<_i559.RestaurantsRemoteDatasourceImpl>(
        () => _i559.RestaurantsRemoteDatasourceImpl(
              gh<_i961.DioRequest>(),
              gh<_i275.ConstantsBaseUrl>(),
            ));
    return this;
  }
}

class _$InjectionModule extends _i887.InjectionModule {
  _$InjectionModule(this._getIt);

  final _i174.GetIt _getIt;

  @override
  _i981.GetListRestaurantsUsecase get getListRestaurantsUsecase =>
      _i981.GetListRestaurantsUsecase(_getIt<_i679.RestaurantsRepository>());

  @override
  _i998.GetDetailRestaurantsUsecase get getDetailRestoUsecase =>
      _i998.GetDetailRestaurantsUsecase(_getIt<_i679.RestaurantsRepository>());

  @override
  _i136.SearchRestaurantsUsecase get searchRestaurantsUsecase =>
      _i136.SearchRestaurantsUsecase(_getIt<_i679.RestaurantsRepository>());

  @override
  _i144.PostReviewUsecase get postReviewUsecase =>
      _i144.PostReviewUsecase(_getIt<_i679.RestaurantsRepository>());
}
