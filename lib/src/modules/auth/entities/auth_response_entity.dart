import 'package:ibnt/src/shared/base_entities/base_user_entity.dart';

class AuthResponseEntity extends BaseUserEntity {
  AuthResponseEntity({
    required super.id,
    required super.email,
    required super.role,
    this.token,
  });

  String? token;
}
