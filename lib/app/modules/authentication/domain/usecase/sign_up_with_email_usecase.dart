import 'package:dartz/dartz.dart';
import '../entity/user__auth_entity.dart';
import '../failures/auth_failure.dart';
import '../entity/user_data_entity.dart';
import '../repository/sign_up_with_email_repository.dart';

abstract class ISignUpWithEmailUsecase {
  Future<Either<AuthFailure, UserAuthEntity>> signUpUser(
    UserDataEntity userDataEntity,
    String userAction,
  );
}

class SignUpWithEmailUsecase implements ISignUpWithEmailUsecase {
  final ISignUpWithEmailRepository _signUpWithEmailRepository;

  SignUpWithEmailUsecase(this._signUpWithEmailRepository);

  @override
  Future<Either<AuthFailure, UserAuthEntity>> signUpUser(
    UserDataEntity userDataEntity,
    String userAction,
  ) async =>
      await _signUpWithEmailRepository.signUpUser(
        userDataEntity,
        userAction,
      );
}
