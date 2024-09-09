import 'package:fluttter_fundamental_submission_2/src/core/request/remote/constants_base_url.dart';
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
}
