import 'package:dartz/dartz.dart';
import '../entity/user__auth_entity.dart';
import '../failures/auth_failure.dart';
import '../entity/user_data_entity.dart';

abstract class ISignUpWithEmailRepository {
  Future<Either<AuthFailure, UserAuthEntity>> signUpUser(
    UserDataEntity userDataEntity,
    String userAction,
  );
}
