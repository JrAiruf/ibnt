import 'package:ibnt/src/app_imports.dart';

class CreateUserEntity {
  String fullName;
  String? profileImage;
  AuthEntity authEntity;

  CreateUserEntity({required this.fullName, required this.authEntity, this.profileImage});
}
