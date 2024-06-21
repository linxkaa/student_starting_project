import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:student_lecture_app/domain/calculator/history_entity.dart';
import 'package:student_lecture_app/domain/core/form_failure.dart';
import 'package:student_lecture_app/domain/core/form_validator.dart';

part 'calculator_entity.freezed.dart';

@freezed
class CalculatorEntity with _$CalculatorEntity {
  const CalculatorEntity._();

  factory CalculatorEntity({
    required double value,
    required String leftValue,
    required String rightValue,
    required CalculatorType type,
    required List<HistoryEntity> histories,
  }) = _CalculatorEntity;

  factory CalculatorEntity.empty() => CalculatorEntity(
        value: 0,
        leftValue: "",
        rightValue: "",
        type: const CalculatorType.none(),
        histories: [],
      );

  Option<FormFailure> get failureOption {
    return FormValidator.emptyValidator(leftValue).andThen(() => FormValidator.emptyValidator(rightValue)).fold(
          (failure) => some(failure),
          (_) => none(),
        );
  }

  Either<String, Unit> get _emptyLeftErrorMsg {
    return FormValidator.emptyValidator(leftValue).fold(
      (failure) => failure.maybeWhen(
        orElse: () => right(unit),
        empty: () => left('Left form must not be empty'),
      ),
      (_) => right(unit),
    );
  }

  Either<String, Unit> get _emptyRightErrorMsg {
    return FormValidator.emptyValidator(rightValue).fold(
      (failure) => failure.maybeWhen(
        orElse: () => right(unit),
        empty: () => left('Right form must not be empty'),
      ),
      (_) => right(unit),
    );
  }

  String? get textErrorMsg {
    return _emptyLeftErrorMsg.andThen(() => _emptyRightErrorMsg).fold(
          (errorMsg) => errorMsg,
          (_) => null,
        );
  }

  String get convertValue {
    RegExp regex = RegExp(r'([.]*0)*(?!.*\d)');

    final valueSplitted = value.toString().split('.');

    if (valueSplitted[1].length == 1) {
      // 5.0 -> [5, 0]
      return value.toString().replaceAll(regex, '');
    }

    return value.toStringAsFixed(2).replaceAll(regex, '');
  }

  bool get _isAlreadyAddedInHistories {
    final newHistories = [...histories];

    final isFound = newHistories.any(
      (element) => element.leftValue == leftValue && element.type == type && element.rightValue == rightValue,
    );

    return isFound;
  }

  List<HistoryEntity> get newHistory {
    final newEnt = HistoryEntity.newEntity(
      leftValue: leftValue,
      rightValue: rightValue,
      type: type,
    );

    // * kl mslnya si history nya gaada  di list `histories` maka kita add
    // * history yg `newEnt` ke list histories kita
    if (!_isAlreadyAddedInHistories) {
      final newHistories = [...histories, newEnt];
      return newHistories;
    }

    return histories;
  }

  List<HistoryEntity> removeHistory(HistoryEntity ent) {
    final newHistories = [...histories];

    newHistories.removeWhere((element) => element == ent);

    return newHistories;
  }

  double get addMethod {
    return double.parse(leftValue) + double.parse(rightValue);
  }

  double get substractMethod {
    return double.parse(leftValue) - double.parse(rightValue);
  }

  double get multiplyMethod {
    return double.parse(leftValue) * double.parse(rightValue);
  }

  double get divideMethod {
    return double.parse(leftValue) / double.parse(rightValue);
  }

  double get result {
    return type.when(
      none: () => 0,
      add: () => addMethod,
      substract: () => substractMethod,
      multiply: () => multiplyMethod,
      divide: () => divideMethod,
    );
  }
}

@freezed
class CalculatorType with _$CalculatorType {
  const factory CalculatorType.none() = _None;
  const factory CalculatorType.add() = _Add;
  const factory CalculatorType.substract() = _Substract;
  const factory CalculatorType.multiply() = _Multiply;
  const factory CalculatorType.divide() = _Divide;
}
