import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:nasser_core_package/nasser_core_package.dart';
import 'dependency_init.config.dart';

final GetIt packageGetIt = GetIt.instance;

@InjectableInit(
  usesNullSafety: true,
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<GetIt> nasserCorePackageConfigureDependencies() async {
  // final LoggerEnv loggerEnv = packageGetIt<LoggerEnv>();
  return $initGetIt(packageGetIt);
}
