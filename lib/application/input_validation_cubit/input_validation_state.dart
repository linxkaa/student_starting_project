part of 'input_validation_cubit.dart';

@freezed
class InputValidationState with _$InputValidationState {
  const InputValidationState._();
  const factory InputValidationState({
    required InputValidationEntity entity,
    required bool showError,
    required bool isValid,
  }) = _InputValidationState;

  factory InputValidationState.initial() => InputValidationState(
        entity: InputValidationEntity.empty(),
        showError: false,
        isValid: false,
      );

  InputValidationState get unmodified => copyWith(
        isValid: false,
      );

  String? get showNameErrorMsg => showError ? entity.nameErrorMsg : null;
  String? get showEmailErrorMsg => showError ? entity.emailErrorMsg : null;

  String get title {
    if (isValid) {
      return 'Hi, ${entity.name}!';
    }

    return 'Hi There!';
  }

  String get description {
    if (isValid) {
      return 'Your email was ${entity.email}';
    }

    return 'Please enter your name and email :)';
  }
}
