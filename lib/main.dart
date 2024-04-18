import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery/features/splash_screen/presentation/page/splash_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return ScreenUtilInit(
      designSize: Size(w, h),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Gallery App',
        theme: ThemeData.dark(),
        home: const SplashScreen(),
      ),
    );
  }
}
