import 'package:ibnt/src/modules/home/home_imports.dart';

class AdminEntity extends BaseUserEntity {
  AdminEntity({
    required super.id,
    required super.email,
    required super.role,
    this.fullName,
    this.profileImage,
  });

  String? fullName;
  String? profileImage;
}
