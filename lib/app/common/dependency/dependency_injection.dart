import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../core/httpClient/http_client.dart';
import '../../core/httpClient/http_adapter.dart';
import '../../modules/authentication/domain/usecase/sign_up_with_email_usecase.dart';
import '../../modules/authentication/data/datasource/sign_up_with_email_datasource.dart';
import '../../modules/authentication/data/datasource/user_authentication_datasource.dart';
import '../../modules/authentication/domain/usecase/authentication_with_email_usecase.dart';
import '../../modules/authentication/data/repository/sign_up_with_email_repository_imp.dart';
import '../../modules/authentication/data/repository/user_authentication_repository_imp.dart';
import '../../modules/authentication/presentation/authentication/controller/authentication_controller.dart';

class AppInjection {
  final Dio client = Dio();

  void call(GetIt instanceGetIt) {
    instanceGetIt
      ..registerSingleton(HttpAdapter(client: client))
      ..registerSingleton<IHttpClient>(HttpAdapter(client: client))
      ..registerLazySingleton<UserAuthenticationDataSource>(
        () => UserAuthenticationDataSource(
          httpClient: instanceGetIt<IHttpClient>(),
        ),
      )
      ..registerLazySingleton<SignUpWithEmailDataSource>(
        () => SignUpWithEmailDataSource(
          httpClient: instanceGetIt<HttpAdapter>(),
        ),
      )
      ..registerLazySingleton<UserAuthenticationRepository>(
        () => UserAuthenticationRepository(
          instanceGetIt<UserAuthenticationDataSource>(),
        ),
      )
      ..registerLazySingleton<SignUpWithEmailRepository>(
        () => SignUpWithEmailRepository(
            instanceGetIt<SignUpWithEmailDataSource>()),
      )
      ..registerLazySingleton<AuthenticationEmailUsecase>(
        () => AuthenticationEmailUsecase(
          instanceGetIt<UserAuthenticationRepository>(),
        ),
      )
      ..registerLazySingleton<SignUpWithEmailUsecase>(
        () => SignUpWithEmailUsecase(
          instanceGetIt<SignUpWithEmailRepository>(),
        ),
      )
      ..registerSingleton<AuthenticationController>(
        AuthenticationController(
          signUpWithEmailUsecase: instanceGetIt<SignUpWithEmailUsecase>(),
          authenticationUsecase: instanceGetIt<AuthenticationEmailUsecase>(),
        ),
      );
  }
}
