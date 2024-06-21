import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_lecture_app/application/counter_cubit/counter_cubit.dart';

@RoutePage()
class CounterPage extends StatelessWidget {
  static const fabIncrement = Key('fab-increment');
  static const fabDecrement = Key('fab-decrement');
  static const textCounter = Key('text-counter');

  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: Builder(builder: (context) {
        return Scaffold(
          floatingActionButton: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingActionButton(
                key: fabIncrement,
                onPressed: () {
                  context.read<CounterCubit>().increment();
                },
                child: const Icon(Icons.add),
              ),
              // UIHelper.verticalSpace(10),
              FloatingActionButton(
                key: fabDecrement,
                onPressed: () {
                  context.read<CounterCubit>().decrement();
                },
                child: const Icon(Icons.remove),
              )
            ],
          ),
          appBar: AppBar(
            title: const Text('Counter App'),
          ),
          body: BlocBuilder<CounterCubit, int>(
            builder: (context, state) {
              return Center(
                child: Text(
                  state.toString(),
                  key: textCounter,
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
