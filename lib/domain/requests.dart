// ignore_for_file: public_member_api_docs, sort_constructors_first
class LoginRequest {
  final String email;
  final String password;
  LoginRequest({
    required this.email,
    required this.password,
  });
}

class RegisterRequest {
  final String name;
  final String email;
  final String password;
  RegisterRequest({
    required this.name,
    required this.email,
    required this.password,
  });
}
