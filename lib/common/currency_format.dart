import 'package:intl/intl.dart';
class CurrencyFormat {
  static String convertToIdr(BigInt? number, int decimalDigit) {
    if(number==null){
      return 'Rp0';
    }
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp',
      decimalDigits: decimalDigit,
    );
    return currencyFormatter.format(double.parse('$number'));
  }
}