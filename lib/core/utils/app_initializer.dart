import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:marketi/core/di/service_locator.dart';
import 'package:marketi/core/services/auth_credentials_manager/auth_credentials_manager.dart';
import 'package:marketi/core/utils/app_bloc_observer.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive_ce_flutter/adapters.dart';

class AppInitializer {
  static Future<void> initialize() async {
    await _setupDotEnv();
    await _setupHive();
    await _initBlocObserverAndHydratedBloc();
    await _initServiceLocator();
    await _initAuthCredentials();
  }

  static Future<void> _setupHive() async {
    await Hive.initFlutter();
  }

  static Future<void> _initAuthCredentials() async {
    await getIt<AuthCredentialsManager>().init();
  }

  static Future<void> _initServiceLocator() async {
    await setupServiceLocator();
  }

  static Future<void> _setupDotEnv() async {
    await dotenv.load(fileName: ".env");
  }

  static Future<void> _initBlocObserverAndHydratedBloc() async {
    Bloc.observer = AppBlocObserver();
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorageDirectory.web
          : HydratedStorageDirectory((await getTemporaryDirectory()).path),
    );
  }
}
