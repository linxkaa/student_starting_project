import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:student_lecture_app/application/counter_cubit/counter_cubit.dart';

class MockCounterCubit extends MockCubit<int> implements CounterCubit {}

void main() {
  mainCubit();
}

void mainCubit() {
  group('CounterCubit', () {
    blocTest<CounterCubit, int>(
      'returns array kosong [] ketika gaada function yang dipanggil',
      build: () => CounterCubit(),
      expect: () => [],
    );

    blocTest<CounterCubit, int>(
      'return array berisi number 1 ketika function increment dipanggil',
      build: () => CounterCubit(),
      act: (cubit) => cubit.increment(),
      expect: () => [1],
    );

    blocTest(
      'return array berisi number -1 ketika function decrement dipanggil',
      build: () => CounterCubit(),
      act: (cubit) => cubit.decrement(),
      expect: () => [-1],
    );
  });
}
