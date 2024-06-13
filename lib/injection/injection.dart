import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shoesly/injection/injection.config.dart';
import 'package:shoesly/routes/routes.dart';

final getIt = GetIt.instance;

@InjectableInit()
  void configureDependencies() async {
  GetIt.I.registerFactory(() => ShoeslyRouter());
  getIt.init();
}