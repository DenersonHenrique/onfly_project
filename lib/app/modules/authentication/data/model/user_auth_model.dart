import '../../domain/entity/user__auth_entity.dart';
import 'user_model.dart';

class UserAuthModel extends UserAuthEntity {
  const UserAuthModel({
    required super.record,
    required super.token,
  });

  factory UserAuthModel.fromJson(Map<String, dynamic> json) {
    return UserAuthModel(
      record: UserModel.fromJson(
        json['record'],
      ),
      token: json['token'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'record': record,
        'token': token,
      };
}
