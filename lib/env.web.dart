import 'package:envied/envied.dart';

part 'env.web.g.dart';

@Envied(path: '.env.web', useConstantCase: true)
abstract class Env {
  @EnviedField(defaultValue: 55912)
  static const int proxyCachePort = _Env.proxyCachePort;
  @EnviedField(obfuscate: true)
  static final String googleClientId = _Env.googleClientId;
  @EnviedField(obfuscate: true)
  static final String googleClientSecret = _Env.googleClientSecret;
  @EnviedField(defaultValue: 9003)
  static const int googleRedirectPort = _Env.googleRedirectPort;
  @EnviedField(obfuscate: true)
  static final String baseApiGeneral = _Env.baseApiGeneral;
  @EnviedField(obfuscate: true, defaultValue: '')
  static final String twoApi = _Env.twoApi;
}
