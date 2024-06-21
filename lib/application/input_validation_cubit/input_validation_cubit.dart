import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:student_lecture_app/domain/input_validation/input_validation_entity.dart';

part 'input_validation_cubit.freezed.dart';
part 'input_validation_state.dart';

class InputValidationCubit extends Cubit<InputValidationState> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  InputValidationCubit() : super(InputValidationState.initial()) {
    nameController = TextEditingController()..addListener(onNameChange);
    emailController = TextEditingController()..addListener(onEmailChange);
  }

  void onNameChange() {
    inputName(nameController.text);
  }

  void onEmailChange() {
    inputEmail(emailController.text);
  }

  void inputName(String val) {
    emit(state.unmodified.copyWith.entity(name: val));
  }

  void inputEmail(String val) {
    emit(state.unmodified.copyWith.entity(email: val));
  }

  void submit() {
    state.entity.failureOption.fold(
      () => emit(state.unmodified.copyWith(isValid: true)),
      (failure) => emit(state.unmodified.copyWith(showError: true)),
    );
  }
}
