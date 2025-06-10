import 'package:eval_annotation/eval_annotation.dart';
import 'package:intl/date_symbols.dart';
import 'package:intl/intl.dart' as intl;

@Bind()
class DateFormat {
  late final intl.DateFormat _dateFormat;

  DateFormat([String? newPattern, String? locale]) {
    _dateFormat = intl.DateFormat(newPattern, locale);
  }

  // Constructor riêng để tạo từ intl.DateFormat
  DateFormat._fromIntl(this._dateFormat);

  // @override
  bool get useNativeDigits => _dateFormat.useNativeDigits;

  // @override
  DateFormat addPattern(String? inputPattern, [String separator = ' ']) {
    return DateFormat._fromIntl(
      _dateFormat.addPattern(inputPattern, separator),
    );
  }

  // @override
  DateFormat add_E() {
    return DateFormat._fromIntl(_dateFormat.add_E());
  }

  // @override
  DateFormat add_EEEE() {
    return DateFormat._fromIntl(_dateFormat.add_EEEE());
  }

  // @override
  DateFormat add_H() {
    return DateFormat._fromIntl(_dateFormat.add_H());
  }

  // @override
  DateFormat add_Hm() {
    return DateFormat._fromIntl(_dateFormat.add_Hm());
  }

  // @override
  DateFormat add_Hms() {
    return DateFormat._fromIntl(_dateFormat.add_Hms());
  }

  // @override
  DateFormat add_LLL() {
    return DateFormat._fromIntl(_dateFormat.add_LLL());
  }

  // @override
  DateFormat add_LLLL() {
    return DateFormat._fromIntl(_dateFormat.add_LLLL());
  }

  // @override
  DateFormat add_M() {
    return DateFormat._fromIntl(_dateFormat.add_M());
  }

  // @override
  DateFormat add_MEd() {
    return DateFormat._fromIntl(_dateFormat.add_MEd());
  }

  // @override
  DateFormat add_MMM() {
    return DateFormat._fromIntl(_dateFormat.add_MMM());
  }

  // @override
  DateFormat add_MMMEd() {
    return DateFormat._fromIntl(_dateFormat.add_MMMEd());
  }

  // @override
  DateFormat add_MMMM() {
    return DateFormat._fromIntl(_dateFormat.add_MMMM());
  }

  // @override
  DateFormat add_MMMMEEEEd() {
    return DateFormat._fromIntl(_dateFormat.add_MMMMEEEEd());
  }

  // @override
  DateFormat add_MMMMd() {
    return DateFormat._fromIntl(_dateFormat.add_MMMMd());
  }

  // @override
  DateFormat add_MMMd() {
    return DateFormat._fromIntl(_dateFormat.add_MMMd());
  }

  // @override
  DateFormat add_Md() {
    return DateFormat._fromIntl(_dateFormat.add_Md());
  }

  // @override
  DateFormat add_QQQ() {
    return DateFormat._fromIntl(_dateFormat.add_QQQ());
  }

  // @override
  DateFormat add_QQQQ() {
    return DateFormat._fromIntl(_dateFormat.add_QQQQ());
  }

  // @override
  DateFormat add_d() {
    return DateFormat._fromIntl(_dateFormat.add_d());
  }

  // @override
  DateFormat add_j() {
    return DateFormat._fromIntl(_dateFormat.add_j());
  }

  // @override
  DateFormat add_jm() {
    return DateFormat._fromIntl(_dateFormat.add_jm());
  }

  // @override
  DateFormat add_jms() {
    return DateFormat._fromIntl(_dateFormat.add_jms());
  }

  // @override
  DateFormat add_jmv() {
    return DateFormat._fromIntl(_dateFormat.add_jmv());
  }

  // @override
  DateFormat add_jmz() {
    return DateFormat._fromIntl(_dateFormat.add_jmz());
  }

  // @override
  DateFormat add_jv() {
    return DateFormat._fromIntl(_dateFormat.add_jv());
  }

  // @override
  DateFormat add_jz() {
    return DateFormat._fromIntl(_dateFormat.add_jz());
  }

  // @override
  DateFormat add_m() {
    return DateFormat._fromIntl(_dateFormat.add_m());
  }

  // @override
  DateFormat add_ms() {
    return DateFormat._fromIntl(_dateFormat.add_ms());
  }

  // @override
  DateFormat add_s() {
    return DateFormat._fromIntl(_dateFormat.add_s());
  }

  // @override
  DateFormat add_y() {
    return DateFormat._fromIntl(_dateFormat.add_y());
  }

  // @override
  DateFormat add_yM() {
    return DateFormat._fromIntl(_dateFormat.add_yM());
  }

  // @override
  DateFormat add_yMEd() {
    return DateFormat._fromIntl(_dateFormat.add_yMEd());
  }

  // @override
  DateFormat add_yMMM() {
    return DateFormat._fromIntl(_dateFormat.add_yMMM());
  }

  // @override
  DateFormat add_yMMMEd() {
    return DateFormat._fromIntl(_dateFormat.add_yMMMEd());
  }

  // @override
  DateFormat add_yMMMM() {
    return DateFormat._fromIntl(_dateFormat.add_yMMMM());
  }

  // @override
  DateFormat add_yMMMMEEEEd() {
    return DateFormat._fromIntl(_dateFormat.add_yMMMMEEEEd());
  }

  // @override
  DateFormat add_yMMMMd() {
    return DateFormat._fromIntl(_dateFormat.add_yMMMMd());
  }

  // @override
  DateFormat add_yMMMd() {
    return DateFormat._fromIntl(_dateFormat.add_yMMMd());
  }

  // @override
  DateFormat add_yMd() {
    return DateFormat._fromIntl(_dateFormat.add_yMd());
  }

  // @override
  DateFormat add_yQQQ() {
    return DateFormat._fromIntl(_dateFormat.add_yQQQ());
  }

  // @override
  DateFormat add_yQQQQ() {
    return DateFormat._fromIntl(_dateFormat.add_yQQQQ());
  }

  // @override
  bool get dateOnly => _dateFormat.dateOnly;

  // @override
  DateSymbols get dateSymbols => _dateFormat.dateSymbols;

  // @override
  RegExp get digitMatcher => _dateFormat.digitMatcher;

  // @override
  String format(DateTime date) {
    return _dateFormat.format(date);
  }

  // @override
  String get locale => _dateFormat.locale;

  // @override
  String get localeZero => _dateFormat.localeZero;

  // @override
  int get localeZeroCodeUnit => _dateFormat.localeZeroCodeUnit;

  // @override
  DateTime parse(String inputString, [bool utc = false]) {
    return _dateFormat.parse(inputString, utc);
  }

  // @override
  DateTime parseLoose(String inputString, [bool utc = false]) {
    return _dateFormat.parseLoose(inputString, utc);
  }

  // @override
  DateTime parseStrict(String inputString, [bool utc = false]) {
    return _dateFormat.parseStrict(inputString, utc);
  }

  // @override
  DateTime parseUTC(String inputString) {
    return _dateFormat.parseUTC(inputString);
  }

  // @override
  DateTime parseUtc(String inputString) {
    return _dateFormat.parseUtc(inputString);
  }

  // @override
  String? get pattern => _dateFormat.pattern;

  // @override
  DateTime? tryParse(String inputString, [bool utc = false]) {
    return _dateFormat.tryParse(inputString, utc);
  }

  // @override
  DateTime? tryParseLoose(String inputString, [bool utc = false]) {
    return _dateFormat.tryParseLoose(inputString, utc);
  }

  // @override
  DateTime? tryParseStrict(String inputString, [bool utc = false]) {
    return _dateFormat.tryParseStrict(inputString, utc);
  }

  // @override
  DateTime? tryParseUtc(String inputString) {
    return _dateFormat.tryParseUtc(inputString);
  }

  // @override
  bool get usesAsciiDigits => _dateFormat.usesAsciiDigits;

  // @override
  bool get usesNativeDigits => _dateFormat.usesNativeDigits;

  // @override
  get dateTimeConstructor => throw UnimplementedError();

  // @override
  set dateTimeConstructor(_dateTimeConstructor) {
    throw UnimplementedError();
  }

  // @override
  parsePattern(String pattern) {
    throw UnimplementedError();
  }

  // @override
  set useNativeDigits(bool native) {
    _dateFormat.useNativeDigits = native;
  }
}
