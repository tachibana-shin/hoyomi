// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:dart_eval/dart_eval.dart';
import 'package:dart_eval/dart_eval_bridge.dart';
import 'date_format.dart' hide DateFormat;
import 'package:intl/date_symbols.dart';
import 'package:intl/intl.dart';
import 'package:dart_eval/stdlib/core.dart';
import 'package:hoyomi_bridge/utils/date_format.eval.dart';

/// dart_eval wrapper binding for [DateFormat]
class $DateFormat implements $Instance {
  /// Configure this class for use in a [Runtime]
  static void configureForRuntime(Runtime runtime) {
    runtime.registerBridgeFunc('package:hoyomi_bridge/utils/date_format.dart',
        'DateFormat.', $DateFormat.$new);
  }

  /// Compile-time type specification of [$DateFormat]
  static const $spec = BridgeTypeSpec(
    'package:hoyomi_bridge/utils/date_format.dart',
    'DateFormat',
  );

  /// Compile-time type declaration of [$DateFormat]
  static const $type = BridgeTypeRef($spec);

  /// Compile-time class declaration of [$DateFormat]
  static const $declaration = BridgeClassDef(
    BridgeClassType(
      $type,
      isAbstract: false,
    ),
    constructors: {
      '': BridgeConstructorDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation($type),
          namedParams: [],
          params: [
            BridgeParameter(
              'newPattern',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'locale',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string),
                  nullable: true),
              true,
            ),
          ],
        ),
        isFactory: false,
      ),
      '_fromIntl': BridgeConstructorDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation($type),
          namedParams: [],
          params: [
            BridgeParameter(
              '_dateFormat',
              BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
                  'package:intl/src/intl/date_format.dart', 'DateFormat'))),
              false,
            ),
          ],
        ),
        isFactory: false,
      ),
    },
    methods: {
      'addPattern': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/date_format.dart', 'DateFormat'))),
          namedParams: [],
          params: [
            BridgeParameter(
              'inputPattern',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string),
                  nullable: true),
              false,
            ),
            BridgeParameter(
              'separator',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              true,
            ),
          ],
        ),
      ),
      'add_E': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/date_format.dart', 'DateFormat'))),
          namedParams: [],
          params: [],
        ),
      ),
      'add_EEEE': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/date_format.dart', 'DateFormat'))),
          namedParams: [],
          params: [],
        ),
      ),
      'add_H': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/date_format.dart', 'DateFormat'))),
          namedParams: [],
          params: [],
        ),
      ),
      'add_Hm': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/date_format.dart', 'DateFormat'))),
          namedParams: [],
          params: [],
        ),
      ),
      'add_Hms': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/date_format.dart', 'DateFormat'))),
          namedParams: [],
          params: [],
        ),
      ),
      'add_LLL': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/date_format.dart', 'DateFormat'))),
          namedParams: [],
          params: [],
        ),
      ),
      'add_LLLL': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/date_format.dart', 'DateFormat'))),
          namedParams: [],
          params: [],
        ),
      ),
      'add_M': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/date_format.dart', 'DateFormat'))),
          namedParams: [],
          params: [],
        ),
      ),
      'add_MEd': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/date_format.dart', 'DateFormat'))),
          namedParams: [],
          params: [],
        ),
      ),
      'add_MMM': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/date_format.dart', 'DateFormat'))),
          namedParams: [],
          params: [],
        ),
      ),
      'add_MMMEd': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/date_format.dart', 'DateFormat'))),
          namedParams: [],
          params: [],
        ),
      ),
      'add_MMMM': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/date_format.dart', 'DateFormat'))),
          namedParams: [],
          params: [],
        ),
      ),
      'add_MMMMEEEEd': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/date_format.dart', 'DateFormat'))),
          namedParams: [],
          params: [],
        ),
      ),
      'add_MMMMd': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/date_format.dart', 'DateFormat'))),
          namedParams: [],
          params: [],
        ),
      ),
      'add_MMMd': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/date_format.dart', 'DateFormat'))),
          namedParams: [],
          params: [],
        ),
      ),
      'add_Md': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/date_format.dart', 'DateFormat'))),
          namedParams: [],
          params: [],
        ),
      ),
      'add_QQQ': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/date_format.dart', 'DateFormat'))),
          namedParams: [],
          params: [],
        ),
      ),
      'add_QQQQ': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/date_format.dart', 'DateFormat'))),
          namedParams: [],
          params: [],
        ),
      ),
      'add_d': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/date_format.dart', 'DateFormat'))),
          namedParams: [],
          params: [],
        ),
      ),
      'add_j': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/date_format.dart', 'DateFormat'))),
          namedParams: [],
          params: [],
        ),
      ),
      'add_jm': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/date_format.dart', 'DateFormat'))),
          namedParams: [],
          params: [],
        ),
      ),
      'add_jms': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/date_format.dart', 'DateFormat'))),
          namedParams: [],
          params: [],
        ),
      ),
      'add_jmv': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/date_format.dart', 'DateFormat'))),
          namedParams: [],
          params: [],
        ),
      ),
      'add_jmz': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/date_format.dart', 'DateFormat'))),
          namedParams: [],
          params: [],
        ),
      ),
      'add_jv': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/date_format.dart', 'DateFormat'))),
          namedParams: [],
          params: [],
        ),
      ),
      'add_jz': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/date_format.dart', 'DateFormat'))),
          namedParams: [],
          params: [],
        ),
      ),
      'add_m': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/date_format.dart', 'DateFormat'))),
          namedParams: [],
          params: [],
        ),
      ),
      'add_ms': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/date_format.dart', 'DateFormat'))),
          namedParams: [],
          params: [],
        ),
      ),
      'add_s': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/date_format.dart', 'DateFormat'))),
          namedParams: [],
          params: [],
        ),
      ),
      'add_y': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/date_format.dart', 'DateFormat'))),
          namedParams: [],
          params: [],
        ),
      ),
      'add_yM': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/date_format.dart', 'DateFormat'))),
          namedParams: [],
          params: [],
        ),
      ),
      'add_yMEd': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/date_format.dart', 'DateFormat'))),
          namedParams: [],
          params: [],
        ),
      ),
      'add_yMMM': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/date_format.dart', 'DateFormat'))),
          namedParams: [],
          params: [],
        ),
      ),
      'add_yMMMEd': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/date_format.dart', 'DateFormat'))),
          namedParams: [],
          params: [],
        ),
      ),
      'add_yMMMM': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/date_format.dart', 'DateFormat'))),
          namedParams: [],
          params: [],
        ),
      ),
      'add_yMMMMEEEEd': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/date_format.dart', 'DateFormat'))),
          namedParams: [],
          params: [],
        ),
      ),
      'add_yMMMMd': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/date_format.dart', 'DateFormat'))),
          namedParams: [],
          params: [],
        ),
      ),
      'add_yMMMd': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/date_format.dart', 'DateFormat'))),
          namedParams: [],
          params: [],
        ),
      ),
      'add_yMd': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/date_format.dart', 'DateFormat'))),
          namedParams: [],
          params: [],
        ),
      ),
      'add_yQQQ': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/date_format.dart', 'DateFormat'))),
          namedParams: [],
          params: [],
        ),
      ),
      'add_yQQQQ': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
              'package:hoyomi_bridge/utils/date_format.dart', 'DateFormat'))),
          namedParams: [],
          params: [],
        ),
      ),
      'format': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
          namedParams: [],
          params: [
            BridgeParameter(
              'date',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.dateTime)),
              false,
            ),
          ],
        ),
      ),
      'parse': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.dateTime)),
          namedParams: [],
          params: [
            BridgeParameter(
              'inputString',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
            BridgeParameter(
              'utc',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.bool)),
              true,
            ),
          ],
        ),
      ),
      'parseLoose': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.dateTime)),
          namedParams: [],
          params: [
            BridgeParameter(
              'inputString',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
            BridgeParameter(
              'utc',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.bool)),
              true,
            ),
          ],
        ),
      ),
      'parseStrict': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.dateTime)),
          namedParams: [],
          params: [
            BridgeParameter(
              'inputString',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
            BridgeParameter(
              'utc',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.bool)),
              true,
            ),
          ],
        ),
      ),
      'parseUTC': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.dateTime)),
          namedParams: [],
          params: [
            BridgeParameter(
              'inputString',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
          ],
        ),
      ),
      'parseUtc': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.dateTime)),
          namedParams: [],
          params: [
            BridgeParameter(
              'inputString',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
          ],
        ),
      ),
      'tryParse': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.dateTime),
              nullable: true),
          namedParams: [],
          params: [
            BridgeParameter(
              'inputString',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
            BridgeParameter(
              'utc',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.bool)),
              true,
            ),
          ],
        ),
      ),
      'tryParseLoose': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.dateTime),
              nullable: true),
          namedParams: [],
          params: [
            BridgeParameter(
              'inputString',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
            BridgeParameter(
              'utc',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.bool)),
              true,
            ),
          ],
        ),
      ),
      'tryParseStrict': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.dateTime),
              nullable: true),
          namedParams: [],
          params: [
            BridgeParameter(
              'inputString',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
            BridgeParameter(
              'utc',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.bool)),
              true,
            ),
          ],
        ),
      ),
      'tryParseUtc': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.dateTime),
              nullable: true),
          namedParams: [],
          params: [
            BridgeParameter(
              'inputString',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
          ],
        ),
      ),
      'parsePattern': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.dynamic)),
          namedParams: [],
          params: [
            BridgeParameter(
              'pattern',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
          ],
        ),
      ),
    },
    getters: {
      'useNativeDigits': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.bool)),
          namedParams: [],
          params: [],
        ),
      ),
      'dateOnly': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.bool)),
          namedParams: [],
          params: [],
        ),
      ),
      'dateSymbols': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(
              BridgeTypeSpec('package:intl/date_symbols.dart', 'DateSymbols'))),
          namedParams: [],
          params: [],
        ),
      ),
      'digitMatcher': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.regExp)),
          namedParams: [],
          params: [],
        ),
      ),
      'locale': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
          namedParams: [],
          params: [],
        ),
      ),
      'localeZero': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
          namedParams: [],
          params: [],
        ),
      ),
      'localeZeroCodeUnit': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.int)),
          namedParams: [],
          params: [],
        ),
      ),
      'pattern': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string),
              nullable: true),
          namedParams: [],
          params: [],
        ),
      ),
      'usesAsciiDigits': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.bool)),
          namedParams: [],
          params: [],
        ),
      ),
      'usesNativeDigits': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.bool)),
          namedParams: [],
          params: [],
        ),
      ),
      'dateTimeConstructor': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.dynamic)),
          namedParams: [],
          params: [],
        ),
      ),
    },
    setters: {
      'dateTimeConstructor=': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.voidType)),
          namedParams: [],
          params: [
            BridgeParameter(
              '_dateTimeConstructor',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.dynamic)),
              false,
            ),
          ],
        ),
      ),
      'useNativeDigits=': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.voidType)),
          namedParams: [],
          params: [
            BridgeParameter(
              'native',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.bool)),
              false,
            ),
          ],
        ),
      ),
    },
    fields: {
      '_dateFormat': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(BridgeTypeSpec(
            'package:intl/src/intl/date_format.dart', 'DateFormat'))),
        isStatic: false,
      ),
    },
    wrap: true,
  );

  /// Wrapper for the [DateFormat.new] constructor
  static $Value? $new(Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $DateFormat.wrap(
      DateFormat(args[0]?.$value, args[1]?.$value),
    );
  }

  final $Instance _superclass;

  @override
  final DateFormat $value;

  @override
  DateFormat get $reified => $value;

  /// Wrap a [DateFormat] in a [$DateFormat]
  $DateFormat.wrap(this.$value) : _superclass = $Object($value);

  @override
  int $getRuntimeType(Runtime runtime) => runtime.lookupType($spec);

  @override
  $Value? $getProperty(Runtime runtime, String identifier) {
    switch (identifier) {
      case 'useNativeDigits':
        final _useNativeDigits = $value.useNativeDigits;
        return $bool(_useNativeDigits);

      case 'dateOnly':
        final _dateOnly = $value.dateOnly;
        return $bool(_dateOnly);

      case 'dateSymbols':
        final _dateSymbols = $value.dateSymbols;
        return runtime.wrapAlways(_dateSymbols);

      case 'digitMatcher':
        final _digitMatcher = $value.digitMatcher;
        return $RegExp.wrap(_digitMatcher);

      case 'locale':
        final _locale = $value.locale;
        return $String(_locale);

      case 'localeZero':
        final _localeZero = $value.localeZero;
        return $String(_localeZero);

      case 'localeZeroCodeUnit':
        final _localeZeroCodeUnit = $value.localeZeroCodeUnit;
        return $int(_localeZeroCodeUnit);

      case 'pattern':
        final _pattern = $value.pattern;
        return _pattern == null ? $null() : $String(_pattern);

      case 'usesAsciiDigits':
        final _usesAsciiDigits = $value.usesAsciiDigits;
        return $bool(_usesAsciiDigits);

      case 'usesNativeDigits':
        final _usesNativeDigits = $value.usesNativeDigits;
        return $bool(_usesNativeDigits);

      case 'dateTimeConstructor':
        final _dateTimeConstructor = $value.dateTimeConstructor;
        return $Object(_dateTimeConstructor);
      case 'addPattern':
        return __addPattern;

      case 'add_E':
        return __add_E;

      case 'add_EEEE':
        return __add_EEEE;

      case 'add_H':
        return __add_H;

      case 'add_Hm':
        return __add_Hm;

      case 'add_Hms':
        return __add_Hms;

      case 'add_LLL':
        return __add_LLL;

      case 'add_LLLL':
        return __add_LLLL;

      case 'add_M':
        return __add_M;

      case 'add_MEd':
        return __add_MEd;

      case 'add_MMM':
        return __add_MMM;

      case 'add_MMMEd':
        return __add_MMMEd;

      case 'add_MMMM':
        return __add_MMMM;

      case 'add_MMMMEEEEd':
        return __add_MMMMEEEEd;

      case 'add_MMMMd':
        return __add_MMMMd;

      case 'add_MMMd':
        return __add_MMMd;

      case 'add_Md':
        return __add_Md;

      case 'add_QQQ':
        return __add_QQQ;

      case 'add_QQQQ':
        return __add_QQQQ;

      case 'add_d':
        return __add_d;

      case 'add_j':
        return __add_j;

      case 'add_jm':
        return __add_jm;

      case 'add_jms':
        return __add_jms;

      case 'add_jmv':
        return __add_jmv;

      case 'add_jmz':
        return __add_jmz;

      case 'add_jv':
        return __add_jv;

      case 'add_jz':
        return __add_jz;

      case 'add_m':
        return __add_m;

      case 'add_ms':
        return __add_ms;

      case 'add_s':
        return __add_s;

      case 'add_y':
        return __add_y;

      case 'add_yM':
        return __add_yM;

      case 'add_yMEd':
        return __add_yMEd;

      case 'add_yMMM':
        return __add_yMMM;

      case 'add_yMMMEd':
        return __add_yMMMEd;

      case 'add_yMMMM':
        return __add_yMMMM;

      case 'add_yMMMMEEEEd':
        return __add_yMMMMEEEEd;

      case 'add_yMMMMd':
        return __add_yMMMMd;

      case 'add_yMMMd':
        return __add_yMMMd;

      case 'add_yMd':
        return __add_yMd;

      case 'add_yQQQ':
        return __add_yQQQ;

      case 'add_yQQQQ':
        return __add_yQQQQ;

      case 'format':
        return __format;

      case 'parse':
        return __parse;

      case 'parseLoose':
        return __parseLoose;

      case 'parseStrict':
        return __parseStrict;

      case 'parseUTC':
        return __parseUTC;

      case 'parseUtc':
        return __parseUtc;

      case 'tryParse':
        return __tryParse;

      case 'tryParseLoose':
        return __tryParseLoose;

      case 'tryParseStrict':
        return __tryParseStrict;

      case 'tryParseUtc':
        return __tryParseUtc;

      case 'parsePattern':
        return __parsePattern;
    }
    return _superclass.$getProperty(runtime, identifier);
  }

  static const $Function __addPattern = $Function(_addPattern);
  static $Value? _addPattern(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DateFormat;
    final result =
        self.$value.addPattern(args[0]!.$value, args[1]?.$value ?? ' ');
    return $DateFormat.wrap(result);
  }

  static const $Function __add_E = $Function(_add_E);
  static $Value? _add_E(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DateFormat;
    final result = self.$value.add_E();
    return $DateFormat.wrap(result);
  }

  static const $Function __add_EEEE = $Function(_add_EEEE);
  static $Value? _add_EEEE(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DateFormat;
    final result = self.$value.add_EEEE();
    return $DateFormat.wrap(result);
  }

  static const $Function __add_H = $Function(_add_H);
  static $Value? _add_H(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DateFormat;
    final result = self.$value.add_H();
    return $DateFormat.wrap(result);
  }

  static const $Function __add_Hm = $Function(_add_Hm);
  static $Value? _add_Hm(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DateFormat;
    final result = self.$value.add_Hm();
    return $DateFormat.wrap(result);
  }

  static const $Function __add_Hms = $Function(_add_Hms);
  static $Value? _add_Hms(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DateFormat;
    final result = self.$value.add_Hms();
    return $DateFormat.wrap(result);
  }

  static const $Function __add_LLL = $Function(_add_LLL);
  static $Value? _add_LLL(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DateFormat;
    final result = self.$value.add_LLL();
    return $DateFormat.wrap(result);
  }

  static const $Function __add_LLLL = $Function(_add_LLLL);
  static $Value? _add_LLLL(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DateFormat;
    final result = self.$value.add_LLLL();
    return $DateFormat.wrap(result);
  }

  static const $Function __add_M = $Function(_add_M);
  static $Value? _add_M(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DateFormat;
    final result = self.$value.add_M();
    return $DateFormat.wrap(result);
  }

  static const $Function __add_MEd = $Function(_add_MEd);
  static $Value? _add_MEd(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DateFormat;
    final result = self.$value.add_MEd();
    return $DateFormat.wrap(result);
  }

  static const $Function __add_MMM = $Function(_add_MMM);
  static $Value? _add_MMM(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DateFormat;
    final result = self.$value.add_MMM();
    return $DateFormat.wrap(result);
  }

  static const $Function __add_MMMEd = $Function(_add_MMMEd);
  static $Value? _add_MMMEd(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DateFormat;
    final result = self.$value.add_MMMEd();
    return $DateFormat.wrap(result);
  }

  static const $Function __add_MMMM = $Function(_add_MMMM);
  static $Value? _add_MMMM(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DateFormat;
    final result = self.$value.add_MMMM();
    return $DateFormat.wrap(result);
  }

  static const $Function __add_MMMMEEEEd = $Function(_add_MMMMEEEEd);
  static $Value? _add_MMMMEEEEd(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DateFormat;
    final result = self.$value.add_MMMMEEEEd();
    return $DateFormat.wrap(result);
  }

  static const $Function __add_MMMMd = $Function(_add_MMMMd);
  static $Value? _add_MMMMd(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DateFormat;
    final result = self.$value.add_MMMMd();
    return $DateFormat.wrap(result);
  }

  static const $Function __add_MMMd = $Function(_add_MMMd);
  static $Value? _add_MMMd(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DateFormat;
    final result = self.$value.add_MMMd();
    return $DateFormat.wrap(result);
  }

  static const $Function __add_Md = $Function(_add_Md);
  static $Value? _add_Md(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DateFormat;
    final result = self.$value.add_Md();
    return $DateFormat.wrap(result);
  }

  static const $Function __add_QQQ = $Function(_add_QQQ);
  static $Value? _add_QQQ(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DateFormat;
    final result = self.$value.add_QQQ();
    return $DateFormat.wrap(result);
  }

  static const $Function __add_QQQQ = $Function(_add_QQQQ);
  static $Value? _add_QQQQ(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DateFormat;
    final result = self.$value.add_QQQQ();
    return $DateFormat.wrap(result);
  }

  static const $Function __add_d = $Function(_add_d);
  static $Value? _add_d(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DateFormat;
    final result = self.$value.add_d();
    return $DateFormat.wrap(result);
  }

  static const $Function __add_j = $Function(_add_j);
  static $Value? _add_j(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DateFormat;
    final result = self.$value.add_j();
    return $DateFormat.wrap(result);
  }

  static const $Function __add_jm = $Function(_add_jm);
  static $Value? _add_jm(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DateFormat;
    final result = self.$value.add_jm();
    return $DateFormat.wrap(result);
  }

  static const $Function __add_jms = $Function(_add_jms);
  static $Value? _add_jms(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DateFormat;
    final result = self.$value.add_jms();
    return $DateFormat.wrap(result);
  }

  static const $Function __add_jmv = $Function(_add_jmv);
  static $Value? _add_jmv(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DateFormat;
    final result = self.$value.add_jmv();
    return $DateFormat.wrap(result);
  }

  static const $Function __add_jmz = $Function(_add_jmz);
  static $Value? _add_jmz(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DateFormat;
    final result = self.$value.add_jmz();
    return $DateFormat.wrap(result);
  }

  static const $Function __add_jv = $Function(_add_jv);
  static $Value? _add_jv(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DateFormat;
    final result = self.$value.add_jv();
    return $DateFormat.wrap(result);
  }

  static const $Function __add_jz = $Function(_add_jz);
  static $Value? _add_jz(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DateFormat;
    final result = self.$value.add_jz();
    return $DateFormat.wrap(result);
  }

  static const $Function __add_m = $Function(_add_m);
  static $Value? _add_m(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DateFormat;
    final result = self.$value.add_m();
    return $DateFormat.wrap(result);
  }

  static const $Function __add_ms = $Function(_add_ms);
  static $Value? _add_ms(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DateFormat;
    final result = self.$value.add_ms();
    return $DateFormat.wrap(result);
  }

  static const $Function __add_s = $Function(_add_s);
  static $Value? _add_s(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DateFormat;
    final result = self.$value.add_s();
    return $DateFormat.wrap(result);
  }

  static const $Function __add_y = $Function(_add_y);
  static $Value? _add_y(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DateFormat;
    final result = self.$value.add_y();
    return $DateFormat.wrap(result);
  }

  static const $Function __add_yM = $Function(_add_yM);
  static $Value? _add_yM(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DateFormat;
    final result = self.$value.add_yM();
    return $DateFormat.wrap(result);
  }

  static const $Function __add_yMEd = $Function(_add_yMEd);
  static $Value? _add_yMEd(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DateFormat;
    final result = self.$value.add_yMEd();
    return $DateFormat.wrap(result);
  }

  static const $Function __add_yMMM = $Function(_add_yMMM);
  static $Value? _add_yMMM(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DateFormat;
    final result = self.$value.add_yMMM();
    return $DateFormat.wrap(result);
  }

  static const $Function __add_yMMMEd = $Function(_add_yMMMEd);
  static $Value? _add_yMMMEd(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DateFormat;
    final result = self.$value.add_yMMMEd();
    return $DateFormat.wrap(result);
  }

  static const $Function __add_yMMMM = $Function(_add_yMMMM);
  static $Value? _add_yMMMM(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DateFormat;
    final result = self.$value.add_yMMMM();
    return $DateFormat.wrap(result);
  }

  static const $Function __add_yMMMMEEEEd = $Function(_add_yMMMMEEEEd);
  static $Value? _add_yMMMMEEEEd(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DateFormat;
    final result = self.$value.add_yMMMMEEEEd();
    return $DateFormat.wrap(result);
  }

  static const $Function __add_yMMMMd = $Function(_add_yMMMMd);
  static $Value? _add_yMMMMd(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DateFormat;
    final result = self.$value.add_yMMMMd();
    return $DateFormat.wrap(result);
  }

  static const $Function __add_yMMMd = $Function(_add_yMMMd);
  static $Value? _add_yMMMd(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DateFormat;
    final result = self.$value.add_yMMMd();
    return $DateFormat.wrap(result);
  }

  static const $Function __add_yMd = $Function(_add_yMd);
  static $Value? _add_yMd(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DateFormat;
    final result = self.$value.add_yMd();
    return $DateFormat.wrap(result);
  }

  static const $Function __add_yQQQ = $Function(_add_yQQQ);
  static $Value? _add_yQQQ(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DateFormat;
    final result = self.$value.add_yQQQ();
    return $DateFormat.wrap(result);
  }

  static const $Function __add_yQQQQ = $Function(_add_yQQQQ);
  static $Value? _add_yQQQQ(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DateFormat;
    final result = self.$value.add_yQQQQ();
    return $DateFormat.wrap(result);
  }

  static const $Function __format = $Function(_format);
  static $Value? _format(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DateFormat;
    final result = self.$value.format(args[0]!.$value);
    return $String(result);
  }

  static const $Function __parse = $Function(_parse);
  static $Value? _parse(Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DateFormat;
    final result = self.$value.parse(args[0]!.$value, args[1]?.$value ?? false);
    return $DateTime.wrap(result);
  }

  static const $Function __parseLoose = $Function(_parseLoose);
  static $Value? _parseLoose(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DateFormat;
    final result =
        self.$value.parseLoose(args[0]!.$value, args[1]?.$value ?? false);
    return $DateTime.wrap(result);
  }

  static const $Function __parseStrict = $Function(_parseStrict);
  static $Value? _parseStrict(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DateFormat;
    final result =
        self.$value.parseStrict(args[0]!.$value, args[1]?.$value ?? false);
    return $DateTime.wrap(result);
  }

  static const $Function __parseUTC = $Function(_parseUTC);
  static $Value? _parseUTC(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DateFormat;
    final result = self.$value.parseUTC(args[0]!.$value);
    return $DateTime.wrap(result);
  }

  static const $Function __parseUtc = $Function(_parseUtc);
  static $Value? _parseUtc(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DateFormat;
    final result = self.$value.parseUtc(args[0]!.$value);
    return $DateTime.wrap(result);
  }

  static const $Function __tryParse = $Function(_tryParse);
  static $Value? _tryParse(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DateFormat;
    final result =
        self.$value.tryParse(args[0]!.$value, args[1]?.$value ?? false);
    return result == null ? $null() : $DateTime.wrap(result);
  }

  static const $Function __tryParseLoose = $Function(_tryParseLoose);
  static $Value? _tryParseLoose(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DateFormat;
    final result =
        self.$value.tryParseLoose(args[0]!.$value, args[1]?.$value ?? false);
    return result == null ? $null() : $DateTime.wrap(result);
  }

  static const $Function __tryParseStrict = $Function(_tryParseStrict);
  static $Value? _tryParseStrict(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DateFormat;
    final result =
        self.$value.tryParseStrict(args[0]!.$value, args[1]?.$value ?? false);
    return result == null ? $null() : $DateTime.wrap(result);
  }

  static const $Function __tryParseUtc = $Function(_tryParseUtc);
  static $Value? _tryParseUtc(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DateFormat;
    final result = self.$value.tryParseUtc(args[0]!.$value);
    return result == null ? $null() : $DateTime.wrap(result);
  }

  static const $Function __parsePattern = $Function(_parsePattern);
  static $Value? _parsePattern(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $DateFormat;
    final result = self.$value.parsePattern(args[0]!.$value);
    return $Object(result);
  }

  @override
  void $setProperty(Runtime runtime, String identifier, $Value value) {
    switch (identifier) {
      case 'dateTimeConstructor':
        $value.dateTimeConstructor = value.$value;
        return;

      case 'useNativeDigits':
        $value.useNativeDigits = value.$value;
        return;
    }
    return _superclass.$setProperty(runtime, identifier, value);
  }
}
