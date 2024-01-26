// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

import '../../../example/repository.dart' as _i8;
import '../../../nasser_core_package.dart' as _i9;
import '../../app_dropdown/bloc/app_dropdown_bloc.dart' as _i3;
import '../../firebase/firebase_analytics_helper.dart' as _i4;
import '../cache/app_cache.dart' as _i7;
import '../network/network.dart' as _i5;
import 'register_module.dart' as _i10;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.factory<_i3.AppDropdownBloc>(() => _i3.AppDropdownBloc());
  gh.factory<_i4.FirebaseAnalyticsHelper>(() => _i4.FirebaseAnalyticsHelper());
  gh.lazySingleton<_i5.Network>(() => _i5.NetworkImpl());
  await gh.factoryAsync<_i6.SharedPreferences>(
    () => registerModule.prefs,
    preResolve: true,
  );
  gh.factory<String>(
    () => registerModule.baseUrl,
    instanceName: 'BaseUrl',
  );
  gh.factory<_i7.AppCache>(() => _i7.AppCacheImpl(gh<_i6.SharedPreferences>()));
  gh.factory<_i8.ExampleRepository>(
      () => _i8.ExampleRepository(network: gh<_i9.Network>()));
  return getIt;
}

class _$RegisterModule extends _i10.RegisterModule {}
