import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_lecture_app/core/routes/app_router.gr.dart';
import 'package:student_lecture_app/presentation/widgets/molecules/action_text.dart';
import 'package:student_lecture_app/presentation/widgets/molecules/platform_app_bar.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/ui_helper.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PlatformAppBar(
        title: Text('Choose Section'),
        needBackButton: false,
      ),
      body: SingleChildScrollView(
        padding: UIHelper.padding(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            ActionText(
              onTap: () {
                AutoRouter.of(context).push(const DummyUIStep1Route());
              },
              title: 'Dummy UI',
              desc: 'Practice flutter UI and get familiar with UI Widgets',
            ),
            ActionText(
              onTap: () {
                AutoRouter.of(context).push(const CounterRoute());
              },
              title: 'Counter Example (State Management)',
              desc: 'Introducing of state management using flutter_bloc. Level: 1',
            ),
            ActionText(
              onTap: () {
                AutoRouter.of(context).push(const InputValidationRoute());
              },
              title: 'Input Validation Example (State Management)',
              desc: 'Flutter state management using flutter_bloc to handle validation in text field. Level: 2',
            ),
            ActionText(
              onTap: () {
                AutoRouter.of(context).push(const CalculatorRoute());
              },
              title: 'Calculator Example (State Management)',
              desc: 'Flutter state management using flutter_bloc to calculate simple syntax. Level: 3',
            ),
            ActionText(
              onTap: () {
                AutoRouter.of(context).push(const NewsRoute());
              },
              title: 'News App',
              desc: 'API calling using free source from NYTimes',
            ),
            ActionText(
              onTap: () {
                AutoRouter.of(context).push(const ToDoRoute());
              },
              title: 'To Do App Example (State Management)',
              desc: 'Create a to do list that saved in local storage using hydrated_bloc. Level: 4',
              needDivider: false,
            ),
          ],
        ),
      ),
    );
  }
}
