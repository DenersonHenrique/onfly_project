import 'package:dartz/dartz.dart';

import '../model/user_data_model.dart';
import '../../domain/failures/auth_failure.dart';
import '../../domain/entity/user_data_entity.dart';
import '../../domain/entity/user__auth_entity.dart';
import '../../../../core/httpClient/http_exception.dart';
import '../datasource/sign_up_with_email_datasource.dart';
import '../../domain/repository/sign_up_with_email_repository.dart';

class SignUpWithEmailRepository implements ISignUpWithEmailRepository {
  final ISignUpWithEmailDataSource _datasource;

  SignUpWithEmailRepository(this._datasource);

  @override
  Future<Either<AuthFailure, UserAuthEntity>> signUpUser(
    UserDataEntity userDataEntity,
    String userAction,
  ) async {
    UserDataModel userDataModel = UserDataModel(
      user: userDataEntity.user,
      password: userDataEntity.password,
    );
    try {
      final response = await _datasource.signUp(
        userDataModel,
        userAction,
      );
      return Right(response);
    } on IHttpException catch (error) {
      return Left(
        AuthFailure.server(message: error.message),
      );
    } catch (error) {
      return Left(AuthFailure.unexpected());
    }
  }
}
