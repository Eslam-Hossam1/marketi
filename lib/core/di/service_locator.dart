import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/data/datasources/auth_remote_data_source/auth_remote_data_source.dart';
import '../../features/auth/data/datasources/auth_remote_data_source/auth_remote_data_source_impl.dart';
import '../../features/auth/data/repos/auth_repo_impl.dart';
import '../../features/auth/domain/repos/auth_repo.dart';
import '../../features/auth/domain/usecases/login_use_case.dart';
import '../../features/auth/domain/usecases/sign_up_use_case.dart';
import '../../features/auth/presentation/manager/login_cubit/login_cubit.dart';
import '../../features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import '../networking/api_consumer.dart';
import '../networking/dio_consumer.dart';
import '../services/auth_credentials_manager/auth_credentials_manager.dart';
import '../services/jwt_decoder/jwt_decoder_service_impl.dart';
import '../services/storage_services/preferences/preferences_service.dart';
import '../services/storage_services/secure_storage/secure_storage_service.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  await _setupCaching();
  _setupNetworking();
  _setupAuth();
}

Future<void> _setupCaching() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  getIt.registerSingleton<PreferencesService>(
    PreferencesService(sharedPreferences),
  );

  AndroidOptions getAndroidOptions() => const AndroidOptions();

  final secureStorage = FlutterSecureStorage(aOptions: getAndroidOptions());

  getIt.registerSingleton<SecureStorageService>(
    SecureStorageService(secureStorage),
  );

  getIt.registerSingleton<AuthCredentialsManager>(
    AuthCredentialsManager(
      secureStorageService: getIt<SecureStorageService>(),
      jwtDecoder: const JwtDecoderServiceImpl(),
    ),
  );
}

void _setupNetworking() {
  getIt.registerLazySingleton<ApiConsumer>(
    () => DioConsumer(dio: Dio()),
  );
}

void _setupAuth() {
  // Data Source
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(getIt<ApiConsumer>()),
  );

  // Repository
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      getIt<AuthRemoteDataSource>(),
      getIt<AuthCredentialsManager>(),
    ),
  );

  // Use Cases
  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(getIt<AuthRepo>()),
  );
  getIt.registerLazySingleton<SignUpUseCase>(
    () => SignUpUseCase(getIt<AuthRepo>()),
  );

  // Cubits (factory — new instance per screen)
  getIt.registerFactory<LoginCubit>(
    () => LoginCubit(getIt<LoginUseCase>()),
  );
  getIt.registerFactory<SignUpCubit>(
    () => SignUpCubit(getIt<SignUpUseCase>()),
  );
}
