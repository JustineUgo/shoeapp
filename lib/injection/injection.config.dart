// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i3;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shoesly/injection/module/service_module.dart' as _i6;
import 'package:shoesly/services/firebase_service.dart' as _i5;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final serviceModule = _$ServiceModule();
    gh.singleton<_i3.FirebaseFirestore>(() => serviceModule.firestore);
    gh.singleton<_i4.FirebaseAuth>(() => serviceModule.auth);
    gh.singleton<_i5.FirebaseService>(() => _i5.FirebaseServiceImpl(
          gh<_i3.FirebaseFirestore>(),
          gh<_i4.FirebaseAuth>(),
        ));
    return this;
  }
}

class _$ServiceModule extends _i6.ServiceModule {}
