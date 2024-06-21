part of 'calculator_cubit.dart';

@freezed
class CalculatorState with _$CalculatorState {
  const CalculatorState._();
  const factory CalculatorState({
    required CalculatorEntity ent,
    required bool showError,
    required bool isValid,
  }) = _CalculatorState;

  factory CalculatorState.initial() => CalculatorState(
        ent: CalculatorEntity.empty(),
        isValid: false,
        showError: false,
      );

  CalculatorState get unmodified => copyWith(isValid: false);

  bool choosenType(CalculatorType type) {
    return type == ent.type;
  }

  bool get typeNotChoosen => ent.type == const CalculatorType.none();

  String get displayValue => isValid ? ent.convertValue : '...';

  String? get showErrorMsg => showError ? ent.textErrorMsg : null;

  bool get isError => showErrorMsg != null;

  String equationText(CalculatorType type) {
    return type.when(
      none: () => '',
      add: () => '+',
      substract: () => '-',
      multiply: () => '*',
      divide: () => '/',
    );
  }

  String historyText(HistoryEntity ent) {
    final equation = equationText(ent.type);
    return '${ent.leftValue} $equation ${ent.rightValue}';
  }
}
