// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShoppingResponseImpl _$$ShoppingResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ShoppingResponseImpl(
      searchMetadata: json['search_metadata'] == null
          ? null
          : SearchMetadata.fromJson(
              json['search_metadata'] as Map<String, dynamic>),
      shoppingResults: (json['shopping_results'] as List<dynamic>?)
              ?.map((e) => ShoppingResult.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      pagination: json['pagination'] == null
          ? null
          : SerpapiPagination.fromJson(
              json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ShoppingResponseImplToJson(
        _$ShoppingResponseImpl instance) =>
    <String, dynamic>{
      'search_metadata': instance.searchMetadata,
      'shopping_results': instance.shoppingResults,
      'pagination': instance.pagination,
    };

_$ShoppingResultImpl _$$ShoppingResultImplFromJson(Map<String, dynamic> json) =>
    _$ShoppingResultImpl(
      position: (json['position'] as num?)?.toInt() ?? 0,
      title: json['title'] as String? ?? '',
      link: json['link'] as String? ?? '',
      thumbnail: json['thumbnail'] as String? ?? '',
      source: json['source'] as String? ?? '',
      price: json['price'] as String? ?? '',
      productLink: json['product_link'] as String? ?? '',
      productId: json['product_id'] as String? ?? '',
      delivery: json['delivery'] as String? ?? '',
    );

Map<String, dynamic> _$$ShoppingResultImplToJson(
        _$ShoppingResultImpl instance) =>
    <String, dynamic>{
      'position': instance.position,
      'title': instance.title,
      'link': instance.link,
      'thumbnail': instance.thumbnail,
      'source': instance.source,
      'price': instance.price,
      'product_link': instance.productLink,
      'product_id': instance.productId,
      'delivery': instance.delivery,
    };

_$SerpapiPaginationImpl _$$SerpapiPaginationImplFromJson(
        Map<String, dynamic> json) =>
    _$SerpapiPaginationImpl(
      current: json['current'] == null
          ? 0
          : const JsonStringToInt().fromJson(json['current']),
      next: json['next'] as String? ?? '',
    );

Map<String, dynamic> _$$SerpapiPaginationImplToJson(
        _$SerpapiPaginationImpl instance) =>
    <String, dynamic>{
      'current': const JsonStringToInt().toJson(instance.current),
      'next': instance.next,
    };
