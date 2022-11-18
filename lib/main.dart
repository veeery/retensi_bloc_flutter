import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:retensi_bloc/constants/app_overlay.dart';
import 'package:retensi_bloc/pages/app_routes.dart';
import 'package:retensi_bloc/services/network/api_repository.dart';
import 'package:retensi_bloc/services/notifications/notification_option.dart';
import 'package:retensi_bloc/services/notifications/notification_service.dart';

void main() async {
  BlocOverrides.runZoned(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await notificationService();
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: AppOverlay.mySystemTheme,
      child: ScreenUtilInit(
          minTextAdapt: true,
          splitScreenMode: true,
          designSize: Size(1080, 2220),
          builder: (context, child) {
            return MaterialApp(
              builder: (context, child) {
                return OrientationBuilder(
                  builder: (context, orientation) {
                    return MediaQuery(
                      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                      child: child!,
                    );
                  },
                );
              },
              debugShowCheckedModeBanner: false,
              title: "Retensi",
              theme: ThemeData(fontFamily: "ProximaNova"),
              initialRoute: AppPages.testing,
              routes: AppRoutes.routes,
            );
          }),
    );
  }
}
