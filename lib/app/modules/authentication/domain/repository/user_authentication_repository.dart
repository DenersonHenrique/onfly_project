import 'package:dartz/dartz.dart';

import '../failures/auth_failure.dart';
import '../entity/user_data_entity.dart';
import '../entity/user__auth_entity.dart';

abstract class IUserAuthenticationRepository {
  Future<Either<AuthFailure, UserAuthEntity>> userAuthentication(
    UserDataEntity userDataEntity,
    String userAction,
  );
}
