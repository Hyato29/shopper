// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lens_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LensResponseImpl _$$LensResponseImplFromJson(Map<String, dynamic> json) =>
    _$LensResponseImpl(
      searchMetadata: json['search_metadata'] == null
          ? null
          : SearchMetadata.fromJson(
              json['search_metadata'] as Map<String, dynamic>),
      searchParameters: json['search_parameters'] == null
          ? null
          : SearchParameters.fromJson(
              json['search_parameters'] as Map<String, dynamic>),
      visualMatches: (json['visual_matches'] as List<dynamic>?)
              ?.map((e) => VisualMatches.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$LensResponseImplToJson(_$LensResponseImpl instance) =>
    <String, dynamic>{
      'search_metadata': instance.searchMetadata,
      'search_parameters': instance.searchParameters,
      'visual_matches': instance.visualMatches,
    };

_$SearchMetadataImpl _$$SearchMetadataImplFromJson(Map<String, dynamic> json) =>
    _$SearchMetadataImpl(
      gl: json['gl'] as String? ?? '',
      q: json['q'] as String? ?? '',
    );

Map<String, dynamic> _$$SearchMetadataImplToJson(
        _$SearchMetadataImpl instance) =>
    <String, dynamic>{
      'gl': instance.gl,
      'q': instance.q,
    };

_$SearchParametersImpl _$$SearchParametersImplFromJson(
        Map<String, dynamic> json) =>
    _$SearchParametersImpl(
      engine: json['engine'] as String? ?? '',
      q: json['q'] as String? ?? '',
      locationRequested: json['location_requested'] as String? ?? '',
      locationUsed: json['location_used'] as String? ?? '',
      googleDomain: json['google_domain'] as String? ?? '',
      hl: json['hl'] as String? ?? '',
      gl: json['gl'] as String? ?? '',
      start: (json['start'] as num?)?.toDouble() ?? 0,
      device: json['device'] as String? ?? '',
    );

Map<String, dynamic> _$$SearchParametersImplToJson(
        _$SearchParametersImpl instance) =>
    <String, dynamic>{
      'engine': instance.engine,
      'q': instance.q,
      'location_requested': instance.locationRequested,
      'location_used': instance.locationUsed,
      'google_domain': instance.googleDomain,
      'hl': instance.hl,
      'gl': instance.gl,
      'start': instance.start,
      'device': instance.device,
    };

_$VisualMatchesImpl _$$VisualMatchesImplFromJson(Map<String, dynamic> json) =>
    _$VisualMatchesImpl(
      position: (json['position'] as num?)?.toInt() ?? 0,
      title: json['title'] as String? ?? '',
      link: json['link'] as String? ?? '',
    );

Map<String, dynamic> _$$VisualMatchesImplToJson(_$VisualMatchesImpl instance) =>
    <String, dynamic>{
      'position': instance.position,
      'title': instance.title,
      'link': instance.link,
    };
