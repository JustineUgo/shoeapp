import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:shoesly/injection/injection.dart';
import 'package:shoesly/routes/routes.dart';
import 'package:shoesly/src/app/home/filter/filter_provider.dart';
import 'package:shoesly/theme/theme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark));
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  configureDependencies(sharedPreferences);
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FilterProvider()),
      ],
      child: Shoesly(),
    ),);
}

// ignore: must_be_immutable
class Shoesly extends StatelessWidget {
  Shoesly({super.key});
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
