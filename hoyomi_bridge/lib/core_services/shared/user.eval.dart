// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:dart_eval/dart_eval.dart';
import 'package:dart_eval/dart_eval_bridge.dart';
import 'user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dart_eval/stdlib/core.dart';

/// dart_eval wrapper binding for [User]
class $User implements $Instance {
  /// Configure this class for use in a [Runtime]
  static void configureForRuntime(Runtime runtime) {
    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/shared/user.dart',
        'User.',
        $User.$new);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/shared/user.dart',
        'User.fromJson',
        $User.$fromJson);
  }

  /// Compile-time type specification of [$User]
  static const $spec = BridgeTypeSpec(
    'package:hoyomi_bridge/core_services/shared/user.dart',
    'User',
  );

  /// Compile-time type declaration of [$User]
  static const $type = BridgeTypeRef($spec);

  /// Compile-time class declaration of [$User]
  static const $declaration = BridgeClassDef(
    BridgeClassType(
      $type,
      isAbstract: false,
    ),
    constructors: {
      '': BridgeConstructorDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation($type),
          namedParams: [
            BridgeParameter(
              'user',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
            BridgeParameter(
              'email',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string),
                  nullable: true),
              true,
            ),
            BridgeParameter(
              'photoUrl',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
            BridgeParameter(
              'fullName',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              false,
            ),
            BridgeParameter(
              'sex',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              true,
            ),
          ],
          params: [],
        ),
        isFactory: true,
      ),
      'fromJson': BridgeConstructorDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation($type),
          namedParams: [],
          params: [
            BridgeParameter(
              'json',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.map)),
              false,
            ),
          ],
        ),
        isFactory: true,
      ),
    },
    methods: {},
    getters: {},
    setters: {},
    fields: {},
    wrap: true,
  );

  /// Wrapper for the [User.new] constructor
  static $Value? $new(Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $User.wrap(
      User(
          user: args[0]!.$value,
          email: args[1]?.$value,
          photoUrl: args[2]!.$value,
          fullName: args[3]!.$value,
          sex: args[4]?.$value ?? Sex.other),
    );
  }

  /// Wrapper for the [User.fromJson] constructor
  static $Value? $fromJson(
      Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $User.wrap(
      User.fromJson((args[0]!.$reified as Map).cast()),
    );
  }

  final $Instance _superclass;

  @override
  final User $value;

  @override
  User get $reified => $value;

  /// Wrap a [User] in a [$User]
  $User.wrap(this.$value) : _superclass = $Object($value);

  @override
  int $getRuntimeType(Runtime runtime) => runtime.lookupType($spec);

  @override
  $Value? $getProperty(Runtime runtime, String identifier) {
    return _superclass.$getProperty(runtime, identifier);
  }

  @override
  void $setProperty(Runtime runtime, String identifier, $Value value) {
    return _superclass.$setProperty(runtime, identifier, value);
  }
}

/// dart_eval wrapper binding for [Sex]
class $Sex implements $Instance {
  /// Configure this class for use in a [Runtime]
  static void configureForRuntime(Runtime runtime) {
    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/shared/user.dart',
        'Sex.',
        $Sex.$new);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/shared/user.dart',
        'Sex.isValid',
        $Sex.$isValid);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/shared/user.dart',
        'Sex.male*g',
        $Sex.$male);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/shared/user.dart',
        'Sex.female*g',
        $Sex.$female);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/shared/user.dart',
        'Sex.other*g',
        $Sex.$other);

    runtime.registerBridgeFunc(
        'package:hoyomi_bridge/core_services/shared/user.dart',
        'Sex.values*g',
        $Sex.$values);
  }

  /// Compile-time type specification of [$Sex]
  static const $spec = BridgeTypeSpec(
    'package:hoyomi_bridge/core_services/shared/user.dart',
    'Sex',
  );

  /// Compile-time type declaration of [$Sex]
  static const $type = BridgeTypeRef($spec);

  /// Compile-time class declaration of [$Sex]
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
          params: [],
        ),
        isFactory: false,
      ),
    },
    methods: {
      'isValid': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.bool)),
          namedParams: [],
          params: [
            BridgeParameter(
              'value',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string),
                  nullable: true),
              false,
            ),
          ],
        ),
        isStatic: true,
      ),
    },
    getters: {},
    setters: {},
    fields: {
      'male': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
        isStatic: true,
      ),
      'female': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
        isStatic: true,
      ),
      'other': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
        isStatic: true,
      ),
      'values': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.list)),
        isStatic: true,
      ),
    },
    wrap: true,
  );

  /// Wrapper for the [Sex.new] constructor
  static $Value? $new(Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $Sex.wrap(
      Sex(),
    );
  }

  /// Wrapper for the [Sex.isValid] method
  static $Value? $isValid(Runtime runtime, $Value? target, List<$Value?> args) {
    final value = Sex.isValid(args[0]!.$value);
    return $bool(value);
  }

  /// Wrapper for the [Sex.male] getter
  static $Value? $male(Runtime runtime, $Value? target, List<$Value?> args) {
    final value = Sex.male;
    return $String(value);
  }

  /// Wrapper for the [Sex.female] getter
  static $Value? $female(Runtime runtime, $Value? target, List<$Value?> args) {
    final value = Sex.female;
    return $String(value);
  }

  /// Wrapper for the [Sex.other] getter
  static $Value? $other(Runtime runtime, $Value? target, List<$Value?> args) {
    final value = Sex.other;
    return $String(value);
  }

  /// Wrapper for the [Sex.values] getter
  static $Value? $values(Runtime runtime, $Value? target, List<$Value?> args) {
    final value = Sex.values;
    return $List.view(value, (e) => $String(e));
  }

  final $Instance _superclass;

  @override
  final Sex $value;

  @override
  Sex get $reified => $value;

  /// Wrap a [Sex] in a [$Sex]
  $Sex.wrap(this.$value) : _superclass = $Object($value);

  @override
  int $getRuntimeType(Runtime runtime) => runtime.lookupType($spec);

  @override
  $Value? $getProperty(Runtime runtime, String identifier) {
    return _superclass.$getProperty(runtime, identifier);
  }

  @override
  void $setProperty(Runtime runtime, String identifier, $Value value) {
    return _superclass.$setProperty(runtime, identifier, value);
  }
}
