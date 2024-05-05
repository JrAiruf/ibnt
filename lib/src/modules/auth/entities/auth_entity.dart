// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ibnt/src/modules/auth/auth_imports.dart';

class AuthEntity {
  String email;
  String password;
  UserRole role;

  AuthEntity({required this.email, required this.password, this.role = UserRole.user});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'role': role == UserRole.user ? "user" : "admin",
    };
  }

  factory AuthEntity.fromMap(Map<String, dynamic> map) {
    return AuthEntity(
      email: map['email'] as String,
      password: map['password'] as String,
      role: map["role"] == "user" ? UserRole.user : UserRole.admin,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthEntity.fromJson(String source) => AuthEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}
