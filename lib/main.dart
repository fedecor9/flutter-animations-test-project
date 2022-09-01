import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/core/common/config.dart';
import 'package:flutter_template/core/common/logger.dart';
import 'package:flutter_template/core/di/di_provider.dart';
import 'package:flutter_template/ui/main/main_screen.dart';

Future main() async {
  await runZonedGuarded(() async {
    await _initSdks();
    runApp(const MyApp());
  }, (exception, stackTrace) async {
    await Logger.fatal(error: exception, stackTrace: stackTrace);
  });
}

Future _initSdks() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Logger.init();
  await Config.initialize();

  await Future.wait([
    DiProvider.init(),
    _initFirebaseSdks(),
  ]);
}

Future _initFirebaseSdks() async {
  // TODO: Add Craslytics, Analytics and other sdks that the project needs
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
        designSize: Size(360, 690),
        minTextAdapt: false,
        splitScreenMode: true,
        builder: (_a, _b) => MainScreen(),
      );
}
