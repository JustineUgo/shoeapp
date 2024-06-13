import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoesly/injection/injection.dart';
import 'package:shoesly/routes/routes.dart';
import 'package:shoesly/theme/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark));
  configureDependencies();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  var routerConfig = getIt<ShoeslyRouter>().config();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ShoeslyTheme.themeData,
      routerConfig: routerConfig,
    );
  }
}
