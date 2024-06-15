
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoesly/injection/injection.config.dart';
import 'package:shoesly/routes/routes.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies(SharedPreferences sharedPreferences) {
  GetIt.I.registerFactory(() => ShoeslyRouter());
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);
  getIt.init();
}
