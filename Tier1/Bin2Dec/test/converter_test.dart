import 'package:flutter_test/flutter_test.dart';
import 'package:Bin2Dec/converter.dart';

Matcher letterError = throwsA(
  predicate((err) =>
      err is ArgumentError &&
      err.message == 'Input must be only 0\'s and/or 1\'s'),
);

Matcher lengthError = throwsA(
  predicate((err) =>
      err is ArgumentError &&
      err.message == 'Input must be of 8 digits or less'),
);

void main() {
  group('Converter', () {
    group('Convert when input IS valid', () {
      test('AND is a full 8 digit', () {
        final converter = Converter();
        final converted = converter.bin2dec('00001010');
        expect(converted, 10);
      });
      test('AND is less than 8 digit', () {
        final converter = Converter();
        final converted = converter.bin2dec('1011');
        expect(converted, 11);
      });

      test('AND is zero', () {
        final converter = Converter();
        final converted = converter.bin2dec('00000000');
        expect(converted, 0);
      });
      test('AND is all ones', () {
        final converter = Converter();
        final converted = converter.bin2dec('11111111');
        expect(converted, 255);
      });
      test('AND input is EMPTY', () {
        final converter = Converter();
        final converted = converter.bin2dec('');
        expect(converted, 0);
      });
    });
    group('DOES NOT convert when input IS NOT valid', () {
      test('AND contains letters', () {
        final converter = Converter();
        expect(() => converter.bin2dec('ab0cdefgh'), letterError);
      });
      test('AND is more than 8 digits', () {
        final converter = Converter();
        expect(() => converter.bin2dec('111111111'), lengthError);
      });
      test('AND contains other digits which are not 0 or 1', () {
        final converter = Converter();
        expect(() => converter.bin2dec('12345678'), letterError);
      });
    });
  });
}
