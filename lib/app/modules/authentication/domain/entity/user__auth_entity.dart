import 'package:equatable/equatable.dart';

class UserAuthEntity extends Equatable {
  final UserEntity record;
  final String token;

  const UserAuthEntity({
    required this.token,
    required this.record,
  });

  @override
  List<Object> get props => [record, token];
}

class UserEntity extends Equatable {
  final String avatar;
  final String collectionId;
  final String collectionName;
  final String created;
  final String email;
  final bool emailVisibility;
  final String id;
  final String name;
  final String updated;
  final String username;
  final bool verified;

  const UserEntity({
    required this.avatar,
    required this.collectionId,
    required this.collectionName,
    required this.created,
    required this.email,
    required this.emailVisibility,
    required this.id,
    required this.name,
    required this.updated,
    required this.username,
    required this.verified,
  });

  @override
  List<Object> get props => [
        avatar,
        collectionId,
        collectionName,
        created,
        email,
        emailVisibility,
        id,
        name,
        updated,
        username,
        verified,
      ];
}
