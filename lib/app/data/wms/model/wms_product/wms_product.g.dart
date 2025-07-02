// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wms_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WmsProductScanResponseImpl _$$WmsProductScanResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$WmsProductScanResponseImpl(
      data: WmsProductScanData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WmsProductScanResponseImplToJson(
        _$WmsProductScanResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$WmsProductScanDataImpl _$$WmsProductScanDataImplFromJson(
        Map<String, dynamic> json) =>
    _$WmsProductScanDataImpl(
      status: json['status'] as bool,
      message: json['message'] as String,
      resource: WmsProductScanResource.fromJson(
          json['resource'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WmsProductScanDataImplToJson(
        _$WmsProductScanDataImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'resource': instance.resource,
    };

_$WmsProductScanResourceImpl _$$WmsProductScanResourceImplFromJson(
        Map<String, dynamic> json) =>
    _$WmsProductScanResourceImpl(
      currentPage: (json['current_page'] as num).toInt(),
      lastPage: (json['last_page'] as num).toInt(),
      total: (json['total'] as num).toInt(),
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => WmsProduct.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$WmsProductScanResourceImplToJson(
        _$WmsProductScanResourceImpl instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'last_page': instance.lastPage,
      'total': instance.total,
      'data': instance.data,
    };

_$WmsProductImpl _$$WmsProductImplFromJson(Map<String, dynamic> json) =>
    _$WmsProductImpl(
      id: (json['id'] as num).toInt(),
      productName: json['product_name'] as String,
      productPrice: json['product_price'] as String,
      image: json['image'] as String?,
      imageUrl: json['image_url'] as String?,
      createdAt: json['created_at'] as String,
      user: json['user'] == null
          ? null
          : WmsUser.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WmsProductImplToJson(_$WmsProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_name': instance.productName,
      'product_price': instance.productPrice,
      'image': instance.image,
      'image_url': instance.imageUrl,
      'created_at': instance.createdAt,
      'user': instance.user,
    };
