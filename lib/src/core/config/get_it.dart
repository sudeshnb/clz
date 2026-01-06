import 'package:clz/src/core/localization/cubit.dart';
import 'package:clz/src/core/network/network_info.dart';
import 'package:clz/src/core/network/network_info_impl.dart';
import 'package:clz/src/core/services/cache.dart';
import 'package:clz/src/core/theme/cubit.dart';
import 'package:clz/src/core/widgets/scroll.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  getIt.registerLazySingleton<CacheClient>(() => CacheClient());

  // Register AuthBloc as a factory
  getIt.registerLazySingleton(() => Connectivity());
  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(connectivity: getIt<Connectivity>()),
  );

  getIt.registerFactory(() => ThemeCubit());
  // getIt.registerLazySingleton(() => NavigationCubit());
  getIt.registerLazySingleton(() => LocaleCubit());
  getIt.registerLazySingleton(() => ScrollDetectCubit());
}
