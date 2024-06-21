import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:student_lecture_app/domain/core/form_failure.dart';
import 'package:student_lecture_app/domain/core/form_validator.dart';
import 'package:student_lecture_app/domain/todo/to_do_history_entity.dart';

part 'to_do_entity.freezed.dart';
part 'to_do_entity.g.dart';

@freezed
class ToDoEntity with _$ToDoEntity {
  const ToDoEntity._();
  const factory ToDoEntity({
    required int id,
    required String text,
    required bool isDone,
    required List<ToDoHistoryEntity> histories,
    required ToDoHistoryType type,
  }) = _ToDoEntity;

  factory ToDoEntity.empty() => const ToDoEntity(
        id: 0,
        text: '',
        isDone: false,
        histories: [],
        type: ToDoHistoryType.all(),
      );

  Option<FormFailure> get failureOption {
    return FormValidator.emptyValidator(text)
        .andThen(() => FormValidator.customValidator(validator: _cannotAddTheSameText))
        .fold(
          (failure) => some(failure),
          (_) => none(),
        );
  }

  bool get _cannotAddTheSameText {
    final isRedundant = histories.any((element) => element.text.toLowerCase() == text.toLowerCase());

    return isRedundant;
  }

  Either<String, Unit> get _todoEmptyErrorMsg {
    return FormValidator.emptyValidator(text).fold(
      (failure) => failure.maybeWhen(
        orElse: () => right(unit),
        empty: () => left('To Do cannot be empty'),
      ),
      (_) => right(unit),
    );
  }

  Either<String, Unit> get _todoRedundantErrorMsg {
    return FormValidator.customValidator(validator: _cannotAddTheSameText).fold(
      (failure) => failure.maybeWhen(
        orElse: () => right(unit),
        costumError: () => left('To Do already exist'),
      ),
      (_) => right(unit),
    );
  }

  String? get textErrorMsg {
    return _todoEmptyErrorMsg.fold(
      (error) => error,
      (valid) => _todoRedundantErrorMsg.fold(
        (error) => error,
        (valid) => null,
      ),
    );
  }

  List<ToDoHistoryEntity> removeToDoHistory(ToDoHistoryEntity ent) {
    final newHistories = [...histories];
    newHistories.removeWhere((element) => element == ent);

    return newHistories;
  }

  List<ToDoHistoryEntity> get newHistories {
    final newHistory = ToDoHistoryEntity.newEntity(text: text);
    final newHistories = [...histories, newHistory];

    return newHistories;
  }

  List<ToDoHistoryEntity> updateHistories({
    int? id,
    String? text,
    bool? isDone,
  }) {
    final newHistories = [...histories];
    final newEntity = newHistories.singleWhere((element) => element.id == id);
    final index = newHistories.indexOf(newEntity);
    newHistories[index] = newHistories[index].copyWith(
      text: text ?? newEntity.text,
      isDone: isDone ?? newEntity.isDone,
    );

    return newHistories;
  }

  factory ToDoEntity.fromJson(Map<String, dynamic> json) => _$ToDoEntityFromJson(json);
}
