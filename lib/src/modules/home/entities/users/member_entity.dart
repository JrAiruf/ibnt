import 'package:ibnt/src/modules/home/home_imports.dart';

class MemberEntity extends BaseUserEntity {
  MemberEntity({
    required super.id,
    required super.email,
    required super.role,
    super.departmentAssociation = false,
    this.fullName,
    this.profileImage,
  });

  String? fullName;
  String? profileImage;
}
