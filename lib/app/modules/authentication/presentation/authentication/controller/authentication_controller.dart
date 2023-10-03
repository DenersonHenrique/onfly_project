import 'package:mobx/mobx.dart';

import '../../../domain/entity/user_data_entity.dart';
import '../../../domain/entity/user__auth_entity.dart';
import '../../../domain/usecase/sign_up_with_email_usecase.dart';
import '../../../domain/usecase/authentication_with_email_usecase.dart';
part 'authentication_controller.g.dart';

class AuthenticationController = _AuthenticationControllerBase
    with _$AuthenticationController;

abstract class _AuthenticationControllerBase with Store {
  final SignUpWithEmailUsecase _signUpWithEmailUsecase;
  final AuthenticationEmailUsecase _authenticationUsecase;

  _AuthenticationControllerBase({
    required SignUpWithEmailUsecase signUpWithEmailUsecase,
    required AuthenticationEmailUsecase authenticationUsecase,
  })  : _authenticationUsecase = authenticationUsecase,
        _signUpWithEmailUsecase = signUpWithEmailUsecase;

  @observable
  UserAuthEntity? _userEntity;

  @observable
  UserDataEntity _userDataEntity = UserDataEntity(user: '', password: '');

  UserDataEntity? get userDataEntity => _userDataEntity;

  @action
  void setUser(String? value) => _userDataEntity.user = value ?? '';

  @action
  void setPassword(String? value) => _userDataEntity.password = value ?? '';

  @action
  Future<void> authenticateUser(String isAuthenticated) async {
    final result = await _authenticationUsecase.userAuthentication(
      _userDataEntity,
      isAuthenticated,
    );
    result.fold(
      (failure) => print(failure),
      (result) => result,
    );
  }

  @action
  Future<void> signUpUser(String isAuthenticated) async {
    final result = await _signUpWithEmailUsecase.signUpUser(
      _userDataEntity,
      isAuthenticated,
    );
    result.fold(
      (failure) => print(failure),
      (result) => _userEntity = result,
    );
  }
}
