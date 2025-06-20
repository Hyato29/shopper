import 'package:json_annotation/json_annotation.dart';

class TryParseDateTime implements JsonConverter<DateTime?, String?> {
  const TryParseDateTime();

  @override
  DateTime? fromJson(String? json) =>
      json != null ? DateTime.tryParse(json)?.toLocal() : null;

  @override
  String? toJson(DateTime? object) => object?.toUtc().toIso8601String();
}
