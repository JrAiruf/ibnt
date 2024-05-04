// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ibnt/src/shared/shared_imports.dart';

abstract class BaseUserEntity {
  String id;
  String email;
  String token;
  UserRole role = UserRole.user;

  BaseUserEntity({
    required this.id,
    required this.email,
    required this.token,
    required this.role,
  });
}
