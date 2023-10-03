import '../../domain/entity/user_data_entity.dart';

class UserDataModel extends UserDataEntity {
  UserDataModel({
    required String user,
    required String password,
  }) : super(user: user, password: password);
}
