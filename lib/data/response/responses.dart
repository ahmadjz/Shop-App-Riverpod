import 'package:json_annotation/json_annotation.dart';

part 'responses.g.dart';

@JsonSerializable()
class UserResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "name")
  String? name;

  UserResponse(this.id, this.email, this.name);

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

@JsonSerializable()
class AuthenticationResponse {
  @JsonKey(name: "user")
  UserResponse? userData;
  @JsonKey(name: "token")
  String? token;

  AuthenticationResponse(this.userData, this.token);

  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticationResponseToJson(this);
}

@JsonSerializable()
class TokenCheckResponse {
  @JsonKey(name: "user")
  UserResponse? userData;
  @JsonKey(name: "message")
  String? message;

  TokenCheckResponse(this.userData, this.message);

  factory TokenCheckResponse.fromJson(Map<String, dynamic> json) =>
      _$TokenCheckResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TokenCheckResponseToJson(this);
}

@JsonSerializable()
class LogoutResponse {
  @JsonKey(name: "message")
  String? message;

  LogoutResponse(this.message);

  factory LogoutResponse.fromJson(Map<String, dynamic> json) =>
      _$LogoutResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LogoutResponseToJson(this);
}
