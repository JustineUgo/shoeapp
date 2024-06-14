import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoesly/injection/injection.dart';
import 'package:shoesly/routes/routes.dart';
import 'package:shoesly/theme/theme.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: const  FirebaseOptions(
    apiKey: 'AIzaSyB4GkQ8ULMwYiWR4wl_iur7vyDdWtxhbng',
    appId: '1:419855959896:android:a6dd3d0aff403e826b072d',
    messagingSenderId: '',
    projectId: 'shoesly-e685dp',
    storageBucket: 'shoesly-e685d.appspot.com',
  ));
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
