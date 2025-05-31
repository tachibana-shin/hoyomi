import 'package:json_annotation/json_annotation.dart';

@JsonEnum(fieldRename: FieldRename.snake)
enum StatusEnum {
  ongoing,
  completed,
  canceled,
  unknown,
  onHiatus,
  publishingFinished,
}
