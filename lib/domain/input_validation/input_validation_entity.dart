import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:student_lecture_app/domain/core/form_failure.dart';
import 'package:student_lecture_app/domain/core/form_validator.dart';

part 'input_validation_entity.freezed.dart';

@freezed
class InputValidationEntity with _$InputValidationEntity {
  const InputValidationEntity._();

  const factory InputValidationEntity({
    required String name,
    required String email,
  }) = _InputValidationEntity;

  factory InputValidationEntity.empty() => const InputValidationEntity(
        name: '',
        email: '',
      );

  Option<FormFailure> get failureOption =>
      FormValidator.emptyValidator(name).andThen(() => FormValidator.emailValidator(email)).fold(
            (failure) => some(failure),
            (_) => none(),
          );

  String? get nameErrorMsg => FormValidator.emptyValidator(name).fold(
        (failure) => failure.maybeWhen(
          orElse: () => null,
          empty: () => 'Name cannot be empty',
        ),
        (_) => null,
      );

  String? get emailErrorMsg => FormValidator.emailValidator(email).fold(
        (failure) => failure.maybeWhen(
          orElse: () => null,
          empty: () => 'Email cannot be empty',
          tooLong: () => 'Email must not exceed 50 characters',
          invalidEmailAddress: () => 'Email is invalid',
        ),
        (_) => null,
      );
}
