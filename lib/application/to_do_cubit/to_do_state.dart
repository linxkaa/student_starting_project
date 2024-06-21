part of 'to_do_cubit.dart';

@freezed
class ToDoState with _$ToDoState {
  const ToDoState._();

  const factory ToDoState({
    required ToDoEntity ent,
    required bool showError,
  }) = _ToDoState;

  factory ToDoState.initial() => ToDoState(
        ent: ToDoEntity.empty(),
        showError: false,
      );

  ToDoState get unmodified => copyWith(ent: ent.copyWith(id: 0));

  bool isTypeChoosen(ToDoHistoryType type) {
    return ent.type == type;
  }

  bool get newTodo => ent.id == 0;

  bool isEdited(int id) => id == ent.id;

  String? get showTextErrorMsg => showError ? ent.textErrorMsg : null;

  String get ctaText => newTodo ? 'Save' : 'Update';

  List<ToDoHistoryEntity> get histories => ent.type.when(
        all: () => ent.histories,
        done: () => ent.histories.where((e) => e.isDone).toList(),
        notDone: () => ent.histories.where((e) => !e.isDone).toList(),
      );
}
