import 'package:dartz/dartz.dart';

import '../model/user_data_model.dart';
import '../../domain/entity/user__auth_entity.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/failures/auth_failure.dart';
import '../../domain/entity/user_data_entity.dart';
import '../datasource/user_authentication_datasource.dart';
import '../../domain/repository/user_authentication_repository.dart';

class UserAuthenticationRepository implements IUserAuthenticationRepository {
  final IUserAuthenticationDataSource _datasource;

  UserAuthenticationRepository(
    this._datasource,
  );

  @override
  Future<Either<AuthFailure, UserAuthEntity>> userAuthentication(
    UserDataEntity userDataEntity,
    String userAction,
  ) async {
    try {
      final UserDataModel userDataModel = UserDataModel(
        user: userDataEntity.user,
        password: userDataEntity.password,
      );
      final response = await _datasource.authenticate(
        userDataModel,
        userAction,
      );
      return Right(response);
    } on AuthFailure catch (error) {
      return Left(AuthFailure.server(message: error.message));
    } on Failure catch (_) {
      return Left(AuthFailure.unexpected());
    }
  }
}
