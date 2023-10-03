import '../../domain/entity/user__auth_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.avatar,
    required super.collectionId,
    required super.collectionName,
    required super.created,
    required super.email,
    required super.emailVisibility,
    required super.id,
    required super.name,
    required super.updated,
    required super.username,
    required super.verified,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      avatar: json['avatar'],
      collectionId: json['collectionId'],
      collectionName: json['collectionName'],
      created: json['created'],
      email: json['email'],
      emailVisibility: json['emailVisibility'],
      id: json['id'],
      name: json['name'],
      updated: json['updated'],
      username: json['username'],
      verified: json['verified'],
    );
  }

  Map<String, dynamic> toJson() => {
        'avatar': avatar,
        'collectionId': collectionId,
        'collectionName': collectionName,
        'created': created,
        'email': email,
        'emailVisibility': emailVisibility,
        'id': id,
        'name': name,
        'updated': updated,
        'username': username,
        'verified': verified,
      };
}
