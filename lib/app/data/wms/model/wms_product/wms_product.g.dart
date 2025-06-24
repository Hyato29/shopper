// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wms_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductScanApiResponseImpl _$$ProductScanApiResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductScanApiResponseImpl(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      pagination:
          PaginationData.fromJson(json['pagination'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => WmsProduct.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ProductScanApiResponseImplToJson(
        _$ProductScanApiResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'pagination': instance.pagination,
      'data': instance.data,
    };

_$PaginationDataImpl _$$PaginationDataImplFromJson(Map<String, dynamic> json) =>
    _$PaginationDataImpl(
      currentPage: (json['currentPage'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      totalItems: (json['totalItems'] as num).toInt(),
    );

Map<String, dynamic> _$$PaginationDataImplToJson(
        _$PaginationDataImpl instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'totalPages': instance.totalPages,
      'totalItems': instance.totalItems,
    };

_$WmsProductImpl _$$WmsProductImplFromJson(Map<String, dynamic> json) =>
    _$WmsProductImpl(
      id: (json['id'] as num).toInt(),
      productName: json['product_name'] as String,
      productPrice: json['product_price'] as String,
      quantity: (json['quantity'] as num?)?.toInt(),
      status: json['status'] as String?,
      fixedPrice: json['fixed_price'] as String?,
      imageUrl: json['image_url'] as String?,
      scannedAt: json['scanned_at'] as String,
    );

Map<String, dynamic> _$$WmsProductImplToJson(_$WmsProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_name': instance.productName,
      'product_price': instance.productPrice,
      'quantity': instance.quantity,
      'status': instance.status,
      'fixed_price': instance.fixedPrice,
      'image_url': instance.imageUrl,
      'scanned_at': instance.scannedAt,
    };
