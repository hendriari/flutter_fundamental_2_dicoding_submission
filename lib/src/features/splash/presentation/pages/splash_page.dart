import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttter_fundamental_submission_2/src/core/injector/injection.dart';
import 'package:fluttter_fundamental_submission_2/src/core/utils/constants.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late Constants _constants;

  @override
  void initState() {
    _constants = getIt<Constants>();
    Future.delayed(
      const Duration(seconds: 6),
      () => context.pushReplacement('/listRestaurantsPage'),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(_constants.splashAnimation, height: 160.h),
            Text(
              'Find Your Resto',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
