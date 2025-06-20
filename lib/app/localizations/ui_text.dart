import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fskeleton/app/localizations/app_localizations.dart';

part 'ui_text.freezed.dart';

@freezed
class UiText with _$UiText {
  const factory UiText.string(String value) = UiTextString;

  const factory UiText.localized(LocalizationsBuilder builder) =
      UiTextLocalizations;

  static const empty = UiText.string('');
}

typedef LocalizationsBuilder = String Function(AppLocalizations localizations);

extension BuildContextLocalizations on BuildContext {
  AppLocalizations get localizations => AppLocalizations.of(this);

  String getString(UiText text) {
    return text.when(
      string: (value) => value,
      localized: (builder) => builder(localizations),
    );
  }
}

extension NullString on String {
  String? nullIfEmpty() {
    if (isEmpty) {
      return null;
    } else {
      return this;
    }
  }
}

extension EmptyFieldFormatter on String? {
  String orDash() {
    if (this == null || this!.isEmpty) {
      return '-';
    } else {
      return this!;
    }
  }
}
