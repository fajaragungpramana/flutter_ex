import 'package:intl/intl.dart';

extension DoubleExtension on double? {

  String get currencyFormat {
    final numberFormat = NumberFormat.currency(
        locale: 'id',
        symbol: 'Rp',
        decimalDigits: 0
    );
    return numberFormat.format(this);
  }

  double get orZero => this ?? 0.0;

}