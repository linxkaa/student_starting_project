import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:student_lecture_app/domain/todo/to_do_entity.dart';
import 'package:student_lecture_app/domain/todo/to_do_history_entity.dart';

part 'to_do_cubit.freezed.dart';
part 'to_do_state.dart';

class ToDoCubit extends HydratedCubit<ToDoState> {
  late TextEditingController textController;
  ToDoCubit() : super(ToDoState.initial()) {
    textController = TextEditingController()..addListener(onControllerChange);
  }

  void onControllerChange() {
    inputText(textController.text);
  }

  void inputText(String val) {
    emit(state.copyWith.ent(text: val));
  }

  void changeType(ToDoHistoryType type) {
    emit(state.copyWith.ent(type: type));
  }

  void editToDoText(ToDoHistoryEntity ent) {
    textController.removeListener(onControllerChange);
    textController.value = TextEditingValue(text: ent.text);
    textController.addListener(onControllerChange);
    emit(state.unmodified.copyWith.ent(
      id: ent.id,
      text: ent.text,
    ));
  }

  void removeToDo(ToDoHistoryEntity ent) {
    emit(state.unmodified.copyWith.ent(
      histories: state.ent.removeToDoHistory(ent),
    ));
  }

  void updateToDoStatus({
    required bool isDone,
    required int id,
  }) {
    emit(
      state.copyWith.ent(
        histories: state.ent.updateHistories(
          isDone: isDone,
          id: id,
        ),
      ),
    );
  }

  void saveTextToHistories() {
    emit(
      state.unmodified.copyWith(showError: false).copyWith.ent(
            histories: state.ent.newHistories,
            text: textController.text,
          ),
    );
  }

  void updateTextToHistories() {
    emit(
      state.unmodified.copyWith(showError: false).copyWith.ent(
            histories: state.ent.updateHistories(
              text: state.ent.text,
              id: state.ent.id,
            ),
          ),
    );
  }

  void submit() {
    state.ent.failureOption.fold(
      () {
        if (state.newTodo) {
          saveTextToHistories();
        } else {
          updateTextToHistories();
        }
        textController.clear();
      },
      (failure) {
        emit(state.copyWith(showError: true));
      },
    );
  }

  @override
  ToDoState? fromJson(Map<String, dynamic> json) {
    return ToDoState(
      ent: ToDoEntity.fromJson(json),
      showError: false,
    );
  }

  @override
  Map<String, dynamic>? toJson(ToDoState state) {
    return state.ent.toJson();
  }
}
