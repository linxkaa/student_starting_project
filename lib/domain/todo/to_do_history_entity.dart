import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'to_do_history_entity.freezed.dart';
part 'to_do_history_entity.g.dart';

@freezed
class ToDoHistoryEntity with _$ToDoHistoryEntity {
  const ToDoHistoryEntity._();
  const factory ToDoHistoryEntity({
    required int id,
    required String text,
    required bool isDone,
  }) = _ToDoHistoryEntity;

  factory ToDoHistoryEntity.newEntity({
    required String text,
  }) =>
      ToDoHistoryEntity(
        id: Random().nextInt(1000),
        text: text,
        isDone: false,
      );

  factory ToDoHistoryEntity.fromJson(Map<String, dynamic> json) => _$ToDoHistoryEntityFromJson(json);
}

@freezed
class ToDoHistoryType with _$ToDoHistoryType {
  const factory ToDoHistoryType.all() = _All;
  const factory ToDoHistoryType.done() = _Done;
  const factory ToDoHistoryType.notDone() = _NotDone;

  factory ToDoHistoryType.fromJson(Map<String, dynamic> json) => _$ToDoHistoryTypeFromJson(json);
}
