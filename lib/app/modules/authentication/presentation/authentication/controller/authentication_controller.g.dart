// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthenticationController on _AuthenticationControllerBase, Store {
  late final _$_userEntityAtom =
      Atom(name: '_AuthenticationControllerBase._userEntity', context: context);

  @override
  UserAuthEntity? get _userEntity {
    _$_userEntityAtom.reportRead();
    return super._userEntity;
  }

  @override
  set _userEntity(UserAuthEntity? value) {
    _$_userEntityAtom.reportWrite(value, super._userEntity, () {
      super._userEntity = value;
    });
  }

  late final _$_userDataEntityAtom = Atom(
      name: '_AuthenticationControllerBase._userDataEntity', context: context);

  @override
  UserDataEntity get _userDataEntity {
    _$_userDataEntityAtom.reportRead();
    return super._userDataEntity;
  }

  @override
  set _userDataEntity(UserDataEntity value) {
    _$_userDataEntityAtom.reportWrite(value, super._userDataEntity, () {
      super._userDataEntity = value;
    });
  }

  late final _$authenticateUserAsyncAction = AsyncAction(
      '_AuthenticationControllerBase.authenticateUser',
      context: context);

  @override
  Future<void> authenticateUser(String isAuthenticated) {
    return _$authenticateUserAsyncAction
        .run(() => super.authenticateUser(isAuthenticated));
  }

  late final _$signUpUserAsyncAction =
      AsyncAction('_AuthenticationControllerBase.signUpUser', context: context);

  @override
  Future<void> signUpUser(String isAuthenticated) {
    return _$signUpUserAsyncAction.run(() => super.signUpUser(isAuthenticated));
  }

  late final _$_AuthenticationControllerBaseActionController =
      ActionController(name: '_AuthenticationControllerBase', context: context);

  @override
  void setUser(String? value) {
    final _$actionInfo = _$_AuthenticationControllerBaseActionController
        .startAction(name: '_AuthenticationControllerBase.setUser');
    try {
      return super.setUser(value);
    } finally {
      _$_AuthenticationControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String? value) {
    final _$actionInfo = _$_AuthenticationControllerBaseActionController
        .startAction(name: '_AuthenticationControllerBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_AuthenticationControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
