// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SavedSearchImpl _$$SavedSearchImplFromJson(Map<String, dynamic> json) =>
    _$SavedSearchImpl(
      image: json['image'] as String,
      keyword: json['keyword'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => ShoppingResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt:
          const TryParseDateTime().fromJson(json['createdAt'] as String?),
    );

Map<String, dynamic> _$$SavedSearchImplToJson(_$SavedSearchImpl instance) =>
    <String, dynamic>{
      'image': instance.image,
      'keyword': instance.keyword,
      'data': instance.data,
      'createdAt': const TryParseDateTime().toJson(instance.createdAt),
    };
