// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      json['id'] as int?,
      json['email'] as String?,
      json['name'] as String?,
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
    };

AuthenticationResponse _$AuthenticationResponseFromJson(
        Map<String, dynamic> json) =>
    AuthenticationResponse(
      json['user'] == null
          ? null
          : UserResponse.fromJson(json['user'] as Map<String, dynamic>),
      json['token'] as String?,
    );

Map<String, dynamic> _$AuthenticationResponseToJson(
        AuthenticationResponse instance) =>
    <String, dynamic>{
      'user': instance.userData,
      'token': instance.token,
    };

TokenCheckResponse _$TokenCheckResponseFromJson(Map<String, dynamic> json) =>
    TokenCheckResponse(
      json['user'] == null
          ? null
          : UserResponse.fromJson(json['user'] as Map<String, dynamic>),
      json['message'] as String?,
    );

Map<String, dynamic> _$TokenCheckResponseToJson(TokenCheckResponse instance) =>
    <String, dynamic>{
      'user': instance.userData,
      'message': instance.message,
    };

LogoutResponse _$LogoutResponseFromJson(Map<String, dynamic> json) =>
    LogoutResponse(
      json['message'] as String?,
    );

Map<String, dynamic> _$LogoutResponseToJson(LogoutResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
    };

PriceResponse _$PriceResponseFromJson(Map<String, dynamic> json) =>
    PriceResponse(
      json['value'] as String?,
      json['currency'] as String?,
      json['formatted'] as String?,
    );

Map<String, dynamic> _$PriceResponseToJson(PriceResponse instance) =>
    <String, dynamic>{
      'value': instance.value,
      'currency': instance.currency,
      'formatted': instance.formatted,
    };

ConversionsResponse _$ConversionsResponseFromJson(Map<String, dynamic> json) =>
    ConversionsResponse(
      json['small'] as String?,
      json['medium'] as String?,
      json['large'] as String?,
      json['default'] as String?,
    );

Map<String, dynamic> _$ConversionsResponseToJson(
        ConversionsResponse instance) =>
    <String, dynamic>{
      'small': instance.small,
      'medium': instance.medium,
      'large': instance.large,
      'default': instance.defaultConversion,
    };

ImageResponse _$ImageResponseFromJson(Map<String, dynamic> json) =>
    ImageResponse(
      json['id'] as int?,
      json['file_name'] as String?,
      json['conversions'] == null
          ? null
          : ConversionsResponse.fromJson(
              json['conversions'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ImageResponseToJson(ImageResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'file_name': instance.fileName,
      'conversions': instance.conversions,
    };

ProductDataResponse _$ProductDataResponseFromJson(Map<String, dynamic> json) =>
    ProductDataResponse(
      json['id'] as int?,
      json['title'] as String?,
      json['description'] as String?,
      json['price'] == null
          ? null
          : PriceResponse.fromJson(json['price'] as Map<String, dynamic>),
      json['image'] == null
          ? null
          : ImageResponse.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductDataResponseToJson(
        ProductDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'image': instance.image,
    };

LinksResponse _$LinksResponseFromJson(Map<String, dynamic> json) =>
    LinksResponse(
      json['first'] as String?,
      json['last'] as String?,
      json['next'] as String?,
      json['prev'] as String?,
    );

Map<String, dynamic> _$LinksResponseToJson(LinksResponse instance) =>
    <String, dynamic>{
      'first': instance.first,
      'last': instance.last,
      'prev': instance.prev,
      'next': instance.next,
    };

MetaLinksResponse _$MetaLinksResponseFromJson(Map<String, dynamic> json) =>
    MetaLinksResponse(
      json['url'] as String?,
      json['label'] as String?,
      json['active'] as bool?,
    );

Map<String, dynamic> _$MetaLinksResponseToJson(MetaLinksResponse instance) =>
    <String, dynamic>{
      'url': instance.url,
      'label': instance.label,
      'active': instance.active,
    };

MetaResponse _$MetaResponseFromJson(Map<String, dynamic> json) => MetaResponse(
      json['current_page'] as int?,
      json['from'] as int?,
      json['last_page'] as int?,
      (json['links'] as List<dynamic>?)
          ?.map((e) => MetaLinksResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['path'] as String?,
      json['per_page'] as String?,
      json['to'] as int?,
      json['total'] as int?,
    );

Map<String, dynamic> _$MetaResponseToJson(MetaResponse instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'last_page': instance.lastPage,
      'from': instance.from,
      'links': instance.metaLinks,
      'path': instance.path,
      'per_page': instance.perPage,
      'to': instance.to,
      'total': instance.total,
    };

ProductsResponse _$ProductsResponseFromJson(Map<String, dynamic> json) =>
    ProductsResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) => ProductDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['links'] == null
          ? null
          : LinksResponse.fromJson(json['links'] as Map<String, dynamic>),
      json['meta'] == null
          ? null
          : MetaResponse.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductsResponseToJson(ProductsResponse instance) =>
    <String, dynamic>{
      'data': instance.products,
      'links': instance.links,
      'meta': instance.meta,
    };

ProductInCartResponse _$ProductInCartResponseFromJson(
        Map<String, dynamic> json) =>
    ProductInCartResponse(
      json['id'] as int?,
      json['product_id'] as int?,
      json['total_quantity'] as int?,
      json['total'] == null
          ? null
          : PriceResponse.fromJson(json['total'] as Map<String, dynamic>),
      json['unit_price'] == null
          ? null
          : PriceResponse.fromJson(json['unit_price'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductInCartResponseToJson(
        ProductInCartResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'total_quantity': instance.totalQuantity,
      'total': instance.totalPrice,
      'unit_price': instance.unitPrice,
    };

CartDataResponse _$CartDataResponseFromJson(Map<String, dynamic> json) =>
    CartDataResponse(
      json['id'] as int?,
      json['total'] == null
          ? null
          : PriceResponse.fromJson(json['total'] as Map<String, dynamic>),
      json['items'] as int?,
      (json['products'] as List<dynamic>?)
          ?.map(
              (e) => ProductInCartResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CartDataResponseToJson(CartDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'total': instance.totalPrice,
      'items': instance.itemsCount,
      'products': instance.productsInCart,
    };

CartResponse _$CartResponseFromJson(Map<String, dynamic> json) => CartResponse(
      json['data'] == null
          ? null
          : CartDataResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CartResponseToJson(CartResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) =>
    ProductResponse(
      json['data'] == null
          ? null
          : ProductDataResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductResponseToJson(ProductResponse instance) =>
    <String, dynamic>{
      'data': instance.product,
    };
