// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ecommerce_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EcommerceSearchResultImpl _$$EcommerceSearchResultImplFromJson(
        Map<String, dynamic> json) =>
    _$EcommerceSearchResultImpl(
      tokopedia: (json['tokopedia'] as List<dynamic>?)
              ?.map((e) => EcommerceProduct.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      shopee: (json['shopee'] as List<dynamic>?)
              ?.map((e) => EcommerceProduct.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      lazada: (json['lazada'] as List<dynamic>?)
              ?.map((e) => EcommerceProduct.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$EcommerceSearchResultImplToJson(
        _$EcommerceSearchResultImpl instance) =>
    <String, dynamic>{
      'tokopedia': instance.tokopedia,
      'shopee': instance.shopee,
      'lazada': instance.lazada,
    };

_$EcommerceProductImpl _$$EcommerceProductImplFromJson(
        Map<String, dynamic> json) =>
    _$EcommerceProductImpl(
      title: json['title'] as String,
      price: json['price'] as String,
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$$EcommerceProductImplToJson(
        _$EcommerceProductImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'price': instance.price,
      'imageUrl': instance.imageUrl,
    };
