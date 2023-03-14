class Utilities {
  static final Utilities _to = Utilities._internal();

  factory Utilities() {
    return _to;
  }

  Utilities._internal() {
    //inital
  }

  static Utilities get to => _to;

  String removeTrailingZero(String string) {
    if (!string.contains('.')) {
      return string;
    }
    string = string.replaceAll(RegExp(r'0*$'), '');
    if (string.endsWith('.')) {
      string = string.substring(0, string.length - 1);
    }
    return string;
  }

  bool isOperator(String x) {
    if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=' || x == '%') {
      return true;
    }
    return false;
  }
}
