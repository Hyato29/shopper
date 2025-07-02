// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wms_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WmsCategoryResponseImpl _$$WmsCategoryResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$WmsCategoryResponseImpl(
      data: WmsCategoryData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WmsCategoryResponseImplToJson(
        _$WmsCategoryResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$WmsCategoryDataImpl _$$WmsCategoryDataImplFromJson(
        Map<String, dynamic> json) =>
    _$WmsCategoryDataImpl(
      status: json['status'] as bool,
      message: json['message'] as String,
      resource: (json['resource'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WmsCategoryDataImplToJson(
        _$WmsCategoryDataImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'resource': instance.resource,
    };

_$CategoryImpl _$$CategoryImplFromJson(Map<String, dynamic> json) =>
    _$CategoryImpl(
      id: (json['id'] as num).toInt(),
      name: json['name_category'] as String,
      discountCategory: (json['discount_category'] as num?)?.toInt(),
      maxPriceCategory: json['max_price_category'] as String?,
    );

Map<String, dynamic> _$$CategoryImplToJson(_$CategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_category': instance.name,
      'discount_category': instance.discountCategory,
      'max_price_category': instance.maxPriceCategory,
    };
