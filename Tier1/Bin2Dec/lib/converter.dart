RegExp _notZeroOrOne = RegExp(r'[^01]');

int _binary(String s) => int.tryParse(s, radix: 2);
int _decimal(String s) => int.tryParse(s);

class Converter {
  int bin2dec(String s) {
    if (s.indexOf(_notZeroOrOne) != -1)
      throw ArgumentError('Input must be only 0\'s and/or 1\'s');

    if (s.length > 8) throw ArgumentError('Input must be of 8 digits or less');

    if (s.length == 0) return 0;

    int binary = _binary(s);
    return _decimal(binary.toRadixString(10));
  }
}
