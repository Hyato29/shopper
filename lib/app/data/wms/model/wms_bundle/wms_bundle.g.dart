// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wms_bundle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WmsGetBundleBasicResponseImpl _$$WmsGetBundleBasicResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$WmsGetBundleBasicResponseImpl(
      data: WmsGetBundleResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WmsGetBundleBasicResponseImplToJson(
        _$WmsGetBundleBasicResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$WmsGetBundleResponseImpl _$$WmsGetBundleResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$WmsGetBundleResponseImpl(
      status: json['status'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      resource: WmsGetBundleResource.fromJson(
          json['resource'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WmsGetBundleResponseImplToJson(
        _$WmsGetBundleResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'resource': instance.resource,
    };

_$WmsGetBundleResourceImpl _$$WmsGetBundleResourceImplFromJson(
        Map<String, dynamic> json) =>
    _$WmsGetBundleResourceImpl(
      currentPage: (json['current_page'] as num?)?.toInt() ?? 0,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => WmsBundle.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      lastPage: (json['last_page'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$WmsGetBundleResourceImplToJson(
        _$WmsGetBundleResourceImpl instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'data': instance.data,
      'last_page': instance.lastPage,
    };

_$WmsBundleImpl _$$WmsBundleImplFromJson(Map<String, dynamic> json) =>
    _$WmsBundleImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      nameBundle: json['name_bundle'] as String? ?? '',
      barcodeBundle: json['barcode_bundle'] as String? ?? '',
      totalProductBundle: (json['total_product_bundle'] as num?)?.toInt() ?? 0,
      totalPriceBundle: json['total_price_bundle'] as String? ?? "0.00",
      totalPriceCustomBundle:
          json['total_price_custom_bundle'] as String? ?? "0.00",
      productBundles: (json['product_bundles'] as List<dynamic>?)
              ?.map((e) => ProductInBundle.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$WmsBundleImplToJson(_$WmsBundleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_bundle': instance.nameBundle,
      'barcode_bundle': instance.barcodeBundle,
      'total_product_bundle': instance.totalProductBundle,
      'total_price_bundle': instance.totalPriceBundle,
      'total_price_custom_bundle': instance.totalPriceCustomBundle,
      'product_bundles': instance.productBundles,
    };

_$ProductInBundleImpl _$$ProductInBundleImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductInBundleImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      newNameProduct: json['new_name_product'] as String? ?? '',
      displayPrice: json['display_price'] as String? ?? "0.00",
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$ProductInBundleImplToJson(
        _$ProductInBundleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'new_name_product': instance.newNameProduct,
      'display_price': instance.displayPrice,
      'image': instance.image,
    };
