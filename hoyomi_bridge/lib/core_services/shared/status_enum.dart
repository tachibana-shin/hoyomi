// import 'package:json_annotation/json_annotation.dart';

// @JsonEnum(fieldRename: FieldRename.snake)
// enum StatusEnum {
//   ongoing,
//   completed,
//   canceled,
//   unknown,
//   onHiatus,
//   publishingFinished,
// }

import 'package:eval_annotation/eval_annotation.dart';

@Bind()
class StatusEnum {
  static const String ongoing = 'ongoing';
  static const String completed = 'completed';
  static const String canceled = 'canceled';
  static const String unknown = 'unknown';
  static const String onHiatus = 'on_hiatus';
  static const String publishingFinished = 'publishing_finished';

  static const List<String> values = [
    ongoing,
    completed,
    canceled,
    unknown,
    onHiatus,
    publishingFinished,
  ];

  static bool isValid(String? value) => values.contains(value);
}
