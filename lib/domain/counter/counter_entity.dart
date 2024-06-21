import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_entity.freezed.dart';

@freezed
class CounterEntity with _$CounterEntity {
  const CounterEntity._();

  const factory CounterEntity({
    required int counterText,
  }) = _CounterEntity;

  factory CounterEntity.empty() => const CounterEntity(counterText: 0);

  CounterEntity get increment {
    return CounterEntity(counterText: counterText + 1);
  }

  CounterEntity get decrement {
    if (counterText < 1) {
      return CounterEntity(counterText: counterText);
    }
    return CounterEntity(counterText: counterText - 1);
  }

  bool get showToastBar => counterText % 2 == 0; // genap
}
