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

@JsonSerializable()
class PriceResponse {
  @JsonKey(name: "value")
  String? value;
  @JsonKey(name: "currency")
  String? currency;
  @JsonKey(name: "formatted")
  String? formatted;

  PriceResponse(
    this.value,
    this.currency,
    this.formatted,
  );

  factory PriceResponse.fromJson(Map<String, dynamic> json) =>
      _$PriceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PriceResponseToJson(this);
}

@JsonSerializable()
class ConversionsResponse {
  @JsonKey(name: "small")
  String? small;
  @JsonKey(name: "medium")
  String? medium;
  @JsonKey(name: "large")
  String? large;
  @JsonKey(name: "default")
  String? defaultConversion;

  ConversionsResponse(
    this.small,
    this.medium,
    this.large,
    this.defaultConversion,
  );

  factory ConversionsResponse.fromJson(Map<String, dynamic> json) =>
      _$ConversionsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ConversionsResponseToJson(this);
}

@JsonSerializable()
class ImageResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "file_name")
  String? fileName;
  @JsonKey(name: "conversions")
  ConversionsResponse? conversions;

  ImageResponse(
    this.id,
    this.fileName,
    this.conversions,
  );

  factory ImageResponse.fromJson(Map<String, dynamic> json) =>
      _$ImageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ImageResponseToJson(this);
}

@JsonSerializable()
class ProductResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "price")
  PriceResponse? price;
  @JsonKey(name: "image")
  ImageResponse? image;

  ProductResponse(
    this.id,
    this.title,
    this.description,
    this.price,
    this.image,
  );

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}

@JsonSerializable()
class LinksResponse {
  @JsonKey(name: "first")
  String? first;
  @JsonKey(name: "last")
  String? last;
  @JsonKey(name: "prev")
  String? prev;
  @JsonKey(name: "next")
  String? next;

  LinksResponse(
    this.first,
    this.last,
    this.next,
    this.prev,
  );

  factory LinksResponse.fromJson(Map<String, dynamic> json) =>
      _$LinksResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LinksResponseToJson(this);
}

@JsonSerializable()
class MetaLinksResponse {
  @JsonKey(name: "url")
  String? url;
  @JsonKey(name: "label")
  String? label;
  @JsonKey(name: "active")
  bool? active;

  MetaLinksResponse(
    this.url,
    this.label,
    this.active,
  );

  factory MetaLinksResponse.fromJson(Map<String, dynamic> json) =>
      _$MetaLinksResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MetaLinksResponseToJson(this);
}

@JsonSerializable()
class MetaResponse {
  @JsonKey(name: "current_page")
  int? currentPage;
  @JsonKey(name: "last_page")
  int? lastPage;
  @JsonKey(name: "from")
  int? from;
  @JsonKey(name: "links")
  List<MetaLinksResponse>? metaLinks;
  @JsonKey(name: "path")
  String? path;
  @JsonKey(name: "per_page")
  String? perPage;
  @JsonKey(name: "to")
  int? to;
  @JsonKey(name: "total")
  int? total;

  MetaResponse(
    this.currentPage,
    this.from,
    this.lastPage,
    this.metaLinks,
    this.path,
    this.perPage,
    this.to,
    this.total,
  );

  factory MetaResponse.fromJson(Map<String, dynamic> json) =>
      _$MetaResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MetaResponseToJson(this);
}

@JsonSerializable()
class ProductsResponse {
  @JsonKey(name: "data")
  List<ProductResponse>? products;
  @JsonKey(name: "links")
  LinksResponse? links;
  @JsonKey(name: "meta")
  MetaResponse? meta;

  ProductsResponse(
    this.products,
    this.links,
    this.meta,
  );

  factory ProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsResponseToJson(this);
}
