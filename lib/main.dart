import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoesly/injection/injection.dart';
import 'package:shoesly/routes/routes.dart';
import 'package:shoesly/theme/theme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark));
  configureDependencies();
  runApp(Shoesly());
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
