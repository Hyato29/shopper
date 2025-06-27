// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identify_product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IdentifyProductResponseImpl _$$IdentifyProductResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$IdentifyProductResponseImpl(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      data: json['data'] == null
          ? null
          : ProductScanData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$IdentifyProductResponseImplToJson(
        _$IdentifyProductResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_$ProductScanDataImpl _$$ProductScanDataImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductScanDataImpl(
      productName: json['product_name'] as String? ?? '',
      productPrice: (json['product_price'] as num?)?.toDouble() ?? 0.0,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$$ProductScanDataImplToJson(
        _$ProductScanDataImpl instance) =>
    <String, dynamic>{
      'product_name': instance.productName,
      'product_price': instance.productPrice,
      'imageUrl': instance.imageUrl,
    };
