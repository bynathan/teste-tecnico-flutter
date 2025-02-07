import 'package:intl/intl.dart';

// ignore: non_constant_identifier_names
String CurrencyWidget(double value) {
  return NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$').format(value);
}