import 'package:fluttter_fundamental_submission_2/src/core/injector/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

GetIt getIt = GetIt.instance;

@InjectableInit()
void getItInjectionInit() => getIt.init();