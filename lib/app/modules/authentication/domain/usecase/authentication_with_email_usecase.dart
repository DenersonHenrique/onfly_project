import 'package:dartz/dartz.dart';

import '../failures/auth_failure.dart';
import '../entity/user_data_entity.dart';
import '../entity/user__auth_entity.dart';
import '../repository/user_authentication_repository.dart';

abstract class IAuthenticationEmailUsecase {
  Future<Either<AuthFailure, UserAuthEntity>> userAuthentication(
    UserDataEntity userDataEntity,
    String userAction,
  );
}

class AuthenticationEmailUsecase implements IAuthenticationEmailUsecase {
  final IUserAuthenticationRepository repository;

  AuthenticationEmailUsecase(this.repository);

  @override
  Future<Either<AuthFailure, UserAuthEntity>> userAuthentication(
    UserDataEntity userDataEntity,
    String userAction,
  ) {
    return repository.userAuthentication(
      userDataEntity,
      userAction,
    );
  }
}
