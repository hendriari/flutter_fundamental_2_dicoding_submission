import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttter_fundamental_submission_2/src/core/injector/injection.dart';
import 'package:fluttter_fundamental_submission_2/src/core/routes/go_route_config.dart';
import 'package:fluttter_fundamental_submission_2/src/core/utils/my_colors.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/presentation/viewmodel/restaurants_viewmodel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  getItInjectionInit();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const RestaurantsApp());
}

class RestaurantsApp extends StatefulWidget {
  const RestaurantsApp({super.key});

  @override
  State<RestaurantsApp> createState() => _RestaurantsAppState();
}

class _RestaurantsAppState extends State<RestaurantsApp> {
  late GoRouteConfig _routeConfig;

  @override
  void initState() {
    _routeConfig = GoRouteConfig();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RestaurantsViewModel(
        getListRestaurantsUsecase: getIt(),
        getDetailRestaurantsUsecase: getIt(),
        searchRestaurantsUsecase: getIt(),
        constantsBaseUrl: getIt(),
        postReviewUsecase: getIt(),
      ),
      child: ScreenUtilInit(
        builder: (context, child) => AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light.copyWith(
            statusBarColor: MyColors.primary600,
          ),
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: _routeConfig.routes,
            theme: ThemeData(
              useMaterial3: false,
              scaffoldBackgroundColor: Colors.white,
              colorScheme: Theme.of(context)
                  .colorScheme
                  .copyWith(secondary: Colors.white),
              textTheme: GoogleFonts.montserratTextTheme(),
            ),
          ),
        ),
      ),
    );
  }
}
