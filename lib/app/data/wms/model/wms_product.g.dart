// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wms_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WmsGetProductBasicResponseImpl _$$WmsGetProductBasicResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$WmsGetProductBasicResponseImpl(
      data:
          WmsGetProductResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WmsGetProductBasicResponseImplToJson(
        _$WmsGetProductBasicResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$WmsGetProductResponseImpl _$$WmsGetProductResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$WmsGetProductResponseImpl(
      status: json['status'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      resource: WmsGetProductResource.fromJson(
          json['resource'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WmsGetProductResponseImplToJson(
        _$WmsGetProductResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'resource': instance.resource,
    };

_$WmsGetProductResourceImpl _$$WmsGetProductResourceImplFromJson(
        Map<String, dynamic> json) =>
    _$WmsGetProductResourceImpl(
      currentPage: (json['current_page'] as num?)?.toInt() ?? 0,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => WmsProduct.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      from: (json['from'] as num?)?.toInt() ?? null,
      lastPage: (json['last_page'] as num?)?.toInt() ?? 0,
      nextPageUrl: json['next_page_url'] as String? ?? null,
      to: (json['to'] as num?)?.toInt() ?? null,
    );

Map<String, dynamic> _$$WmsGetProductResourceImplToJson(
        _$WmsGetProductResourceImpl instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'data': instance.data,
      'from': instance.from,
      'last_page': instance.lastPage,
      'next_page_url': instance.nextPageUrl,
      'to': instance.to,
    };

_$WmsProductImpl _$$WmsProductImplFromJson(Map<String, dynamic> json) =>
    _$WmsProductImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      userId: (json['user_id'] as num?)?.toInt() ?? 0,
      productName: json['product_name'] as String? ?? '',
      productPrice: json['product_price'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      updatedAt: json['updated_at'] as String? ?? '',
    );

Map<String, dynamic> _$$WmsProductImplToJson(_$WmsProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'product_name': instance.productName,
      'product_price': instance.productPrice,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
