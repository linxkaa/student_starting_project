import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_lecture_app/application/to_do_cubit/to_do_cubit.dart';
import 'package:student_lecture_app/core/commons/colors_const.dart';
import 'package:student_lecture_app/domain/todo/to_do_history_entity.dart';
import 'package:student_lecture_app/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:student_lecture_app/presentation/widgets/molecules/chip.dart';
import 'package:student_lecture_app/presentation/widgets/molecules/platform_app_bar.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/text_form_field.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/ui_helper.dart';

part 'widgets/to_do_history_widget.dart';

@RoutePage()
class ToDoPage extends StatelessWidget {
  const ToDoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ToDoCubit(),
      child: Builder(
        builder: (context) {
          return BlocBuilder<ToDoCubit, ToDoState>(
            builder: (context, state) {
              return Scaffold(
                appBar: const PlatformAppBar(
                  title: Text('To Do Page'),
                ),
                bottomNavigationBar: Container(
                  padding: MediaQuery.of(context).viewInsets,
                  margin: UIHelper.padding(horizontal: 10, vertical: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<ToDoCubit>().submit();
                    },
                    child: Text(state.ctaText),
                  ),
                ),
                body: Padding(
                  padding: UIHelper.padding(all: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormFieldCustom(
                        maxLines: 3,
                        title: 'To Do',
                        controller: context.read<ToDoCubit>().textController,
                        hintText: 'Please enter your to do task...',
                        validator: (_) => state.showTextErrorMsg,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          padding: UIHelper.padding(top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'HISTORY',
                                style: context.textTheme.headlineSmall?.copyWith(
                                  color: ColorConstant.green,
                                ),
                              ),
                              UIHelper.verticalSpace(10),
                              Row(
                                children: [
                                  ChipCustom(
                                    onTap: () {
                                      context.read<ToDoCubit>().changeType(const ToDoHistoryType.all());
                                    },
                                    title: 'All',
                                    isChoosen: state.isTypeChoosen(const ToDoHistoryType.all()),
                                  ),
                                  UIHelper.horizontalSpace(10),
                                  ChipCustom(
                                    onTap: () {
                                      context.read<ToDoCubit>().changeType(const ToDoHistoryType.done());
                                    },
                                    title: 'Done',
                                    isChoosen: state.isTypeChoosen(const ToDoHistoryType.done()),
                                  ),
                                  UIHelper.horizontalSpace(10),
                                  ChipCustom(
                                    onTap: () {
                                      context.read<ToDoCubit>().changeType(const ToDoHistoryType.notDone());
                                    },
                                    title: 'Not Done',
                                    isChoosen: state.isTypeChoosen(const ToDoHistoryType.notDone()),
                                  ),
                                ],
                              ),
                              UIHelper.verticalSpace(10),
                              const _ToDoHistoryWidget(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
