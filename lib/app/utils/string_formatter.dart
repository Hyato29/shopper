import 'package:intl/intl.dart';

extension IntExtension on int {
  String toCurrencyFormat() {
    final formatCurrency = NumberFormat.decimalPatternDigits(
      locale: 'id',
      decimalDigits: 0,
    );
    return 'IDR ${formatCurrency.format(this)}';
  }
}
