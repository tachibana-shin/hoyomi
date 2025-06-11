import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:eval_annotation/eval_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
@Bind()
sealed class User with _$User {
  const factory User({
    required String user,
    String? email,
    required String photoUrl,
    required String fullName,
    @Default(Sex.other) String sex,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@Bind()
class Sex {
  static const String male = 'male';
  static const String female = 'female';
  static const String other = 'other';

  static const List<String> values = [male, female, other];

  static bool isValid(String? value) => values.contains(value);
}
