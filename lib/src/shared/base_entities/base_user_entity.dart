// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ibnt/src/shared/shared_imports.dart';

abstract class BaseUserEntity {
  String id;
  String email;
  UserRole role = UserRole.user;
  bool? departmentAssociation;

  BaseUserEntity(
    {
    required this.id,
    required this.email,
    required this.role,
    this.departmentAssociation = true,
  });
}
