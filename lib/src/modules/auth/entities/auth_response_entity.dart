class AuthResponseEntity {
  final String id;
  final String email;
  final String? role;
  final String token;

  AuthResponseEntity({
    required this.id,
    required this.email,
    required this.token,
    this.role,
  });
}
