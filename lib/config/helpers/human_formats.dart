import 'package:intl/intl.dart';

class HumanFormats {
  static String number(double number) {
    // final formatterNumber = NumberFormat.compact(locale: number.toString());
    // return formatterNumber.toString();
    final formatterNumber =
        NumberFormat.compactCurrency(decimalDigits: 0, symbol: '', locale: 'en')
            .format(number);

    return formatterNumber;
  }
}
