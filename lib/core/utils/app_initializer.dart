import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:nextcart/core/di/service_locator.dart';
import 'package:nextcart/core/utils/app_bloc_observer.dart';
import 'package:path_provider/path_provider.dart';

class AppInitializer {
  static Future<void> initialize() async {
    await _initBlocObserverAndHydratedBloc();
    await _initServiceLocator();
  }

  static Future<void> _initServiceLocator() async {
    await setupServiceLocator();
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
