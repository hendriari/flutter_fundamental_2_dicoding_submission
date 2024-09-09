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
    final injectionModule = _$InjectionModule();
    gh.singleton<_i275.ConstantsBaseUrl>(
        () => injectionModule.constantsBaseUrl);
    gh.singleton<Map<String, dynamic>>(
      () => injectionModule.headers,
      instanceName: 'headers',
    );
    gh.factory<_i961.DioRequest>(() => _i961.DioRequest(
          gh<_i275.ConstantsBaseUrl>(),
          gh<Map<String, dynamic>>(instanceName: 'headers'),
        ));
    return this;
  }
}

class _$InjectionModule extends _i887.InjectionModule {}
