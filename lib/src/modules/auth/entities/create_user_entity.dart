// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ibnt/src/modules/auth/auth_imports.dart';

class CreateUserEntity {
  String fullName;
  String? profileImage;
  AuthEntity authEntity;

  CreateUserEntity({required this.fullName, required this.authEntity, this.profileImage});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fullName': fullName,
      'profileImage': profileImage,
      'authEntity': authEntity.toMap(),
    };
  }

  factory CreateUserEntity.fromMap(Map<String, dynamic> map) {
    return CreateUserEntity(
      fullName: map['fullName'] as String,
      profileImage: map['profileImage'] != null ? map['profileImage'] as String : null,
      authEntity: AuthEntity.fromMap(map['authEntity'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateUserEntity.fromJson(String source) => CreateUserEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}
