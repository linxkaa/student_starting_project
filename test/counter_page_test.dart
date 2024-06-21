import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:student_lecture_app/application/counter_cubit/counter_cubit.dart';
import 'package:student_lecture_app/presentation/pages/counter_page/counter_page.dart';

void main() {
  counterPage();
}

void counterPage() {
  testWidgets(
      'User melihat FAB (+) dan FAB (-). Kalo user menclick FAB (+), maka textnya akan berubah dari 0 menjadi 1',
      (widgetTester) async {
    await widgetTester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BlocProvider(
            create: (context) => CounterCubit(),
            child: const CounterPage(),
          ),
        ),
      ),
    );

    final incrementFab = find.byKey(CounterPage.fabIncrement);
    final decrementFab = find.byKey(CounterPage.fabDecrement);

    expect(incrementFab, findsOneWidget);
    expect(decrementFab, findsOneWidget);

    await widgetTester.tap(incrementFab);
    await widgetTester.pumpAndSettle();

    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('''Scenario: User dapat melihat FAB (+) dan FAB (-)
    Given user menclick FAB (+)
    Then user dapat melihat text `0` berubah menjadi `1`
    Given user menclick FAB (-)
    Then user dapat melihat text `1` berubah menjadi `0`
    ''', (widgetTester) async {
    await widgetTester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BlocProvider(
            create: (context) => CounterCubit(),
            child: const CounterPage(),
          ),
        ),
      ),
    );

    final incrementFab = find.byKey(CounterPage.fabIncrement);
    final decrementFab = find.byKey(CounterPage.fabDecrement);
    final textCounter = find.byKey(CounterPage.textCounter);

    expect(incrementFab, findsOneWidget);
    expect(decrementFab, findsOneWidget);
    expect(textCounter, findsOneWidget);

    await widgetTester.tap(incrementFab);
    await widgetTester.pumpAndSettle();

    expect(find.text('1'), findsOneWidget);

    await widgetTester.tap(decrementFab);
    await widgetTester.pumpAndSettle();

    expect(find.text('0'), findsOneWidget);
  });
}
