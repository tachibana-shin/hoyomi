import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
sealed class User with _$User {
  const factory User({
    required String user,
    String? email,
    required String photoUrl,
    required String fullName,
    @Default(Sex.other) Sex sex,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

enum Sex { male, female, other }
