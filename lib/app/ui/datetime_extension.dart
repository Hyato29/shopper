import 'package:flutter/material.dart';
import 'package:fskeleton/app/localizations/ui_text.dart';
import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  DateTime subtractMonth(int byMonth) {
    final startDate = copyWith(month: month - byMonth);
    final isSameMonth = startDate.month == month;

    if (isSameMonth && byMonth % 12 != 0) {
      return startDate.copyWith(month: month, day: 0);
    } else {
      return startDate;
    }
  }

  DateTime startOfDay() {
    return DateTime(year, month, day);
  }

  DateTime endOfDay() {
    return startOfDay()
        .add(const Duration(days: 1))
        .subtract(const Duration(microseconds: 1));
  }

  bool isBetween(DateTimeRange dateTimeRange) {
    return isAfterOrEqual(dateTimeRange.start) &&
        isBeforeOrEqual(dateTimeRange.end);
  }

  bool isAfterOrEqual(DateTime other) {
    return isAfter(other) || isAtSameMomentAs(other);
  }

  bool isBeforeOrEqual(DateTime other) {
    return isBefore(other) || isAtSameMomentAs(other);
  }

  String E(BuildContext context) {
    return DateFormat.E(context.localizations.localeName).format(this);
  }

  String d(BuildContext context) {
    return DateFormat.d(context.localizations.localeName).format(this);
  }

  String yMMMd(BuildContext context) {
    return DateFormat.yMMMd(context.localizations.localeName).format(this);
  }

  String yMMMMd(BuildContext context) {
    return DateFormat.yMMMMd(context.localizations.localeName).format(this);
  }

  String yMMM(BuildContext context) {
    return DateFormat.yMMM(context.localizations.localeName).format(this);
  }

  String yMMMM(BuildContext context) {
    return DateFormat.yMMMM(context.localizations.localeName).format(this);
  }

  String jmz(BuildContext context) {
    return '${DateFormat.jm(context.localizations.localeName).format(this)} $timeZoneName';
  }

  String yMMMdjmz(BuildContext context) {
    return '${yMMMd(context)}, ${jmz(context)}';
  }

  String yMMMMdjmz(BuildContext context) {
    return '${yMMMMd(context)}, ${jmz(context)}';
  }
}
