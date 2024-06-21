import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_lecture_app/application/calculator_cubit/calculator_cubit.dart';
import 'package:student_lecture_app/core/commons/colors_const.dart';
import 'package:student_lecture_app/domain/calculator/calculator_entity.dart';
import 'package:student_lecture_app/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:student_lecture_app/presentation/widgets/molecules/chip.dart';
import 'package:student_lecture_app/presentation/widgets/molecules/platform_app_bar.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/text_form_field.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/ui_helper.dart';

@RoutePage()
class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CalculatorCubit(),
      child: BlocBuilder<CalculatorCubit, CalculatorState>(
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: Container(
              margin: UIHelper.padding(horizontal: 10, vertical: 20),
              child: ElevatedButton(
                onPressed: () {
                  context.read<CalculatorCubit>().submit();
                },
                child: const Text('CALCULATE'),
              ),
            ),
            appBar: const PlatformAppBar(
              title: Text('Calculator Page'),
            ),
            body: SingleChildScrollView(
              padding: UIHelper.padding(vertical: 15, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CHOOSE TYPE',
                    style: context.textTheme.headlineSmall?.copyWith(color: ColorConstant.green),
                  ),
                  UIHelper.verticalSpace(10),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      ChipCustom(
                        onTap: () {
                          context.read<CalculatorCubit>().chooseType(const CalculatorType.add());
                        },
                        title: 'Add',
                        isChoosen: state.choosenType(const CalculatorType.add()),
                      ),
                      ChipCustom(
                        onTap: () {
                          context.read<CalculatorCubit>().chooseType(const CalculatorType.substract());
                        },
                        title: 'Substract',
                        isChoosen: state.choosenType(const CalculatorType.substract()),
                      ),
                      ChipCustom(
                        onTap: () {
                          context.read<CalculatorCubit>().chooseType(const CalculatorType.multiply());
                        },
                        title: 'Multiply',
                        isChoosen: state.choosenType(const CalculatorType.multiply()),
                      ),
                      ChipCustom(
                        onTap: () {
                          context.read<CalculatorCubit>().chooseType(const CalculatorType.divide());
                        },
                        title: 'Divide',
                        isChoosen: state.choosenType(const CalculatorType.divide()),
                      ),
                    ],
                  ),
                  if (!state.typeNotChoosen)
                    Column(
                      children: [
                        UIHelper.verticalSpace(20),
                        Row(
                          children: [
                            SizedBox(
                              width: UIHelper.setSp(60),
                              child: TextFormFieldCustom(
                                keyboardType: TextInputType.number,
                                controller: context.read<CalculatorCubit>().leftController,
                                textAlign: TextAlign.center,
                                style: context.textTheme.displayLarge,
                              ),
                            ),
                            UIHelper.horizontalSpace(10),
                            Text(
                              state.equationText(state.ent.type),
                              style: TextStyle(
                                fontSize: UIHelper.setSp(30),
                              ),
                            ),
                            UIHelper.horizontalSpace(10),
                            SizedBox(
                              width: UIHelper.setSp(60),
                              child: TextFormFieldCustom(
                                keyboardType: TextInputType.number,
                                controller: context.read<CalculatorCubit>().rightController,
                                textAlign: TextAlign.center,
                                style: context.textTheme.displayLarge,
                              ),
                            ),
                            UIHelper.horizontalSpace(10),
                            Text(
                              '= ${state.displayValue}',
                              style: TextStyle(
                                fontSize: UIHelper.setSp(30),
                              ),
                            ),
                          ],
                        ),
                        UIHelper.verticalSpace(15),
                        Container(
                          padding: UIHelper.padding(vertical: 10, horizontal: 15),
                          decoration: BoxDecoration(
                            borderRadius: UIHelper.borderRadiusCircular(all: 5),
                            color: ColorConstant.lightGreen,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.info_outline_rounded,
                                color: !state.isError ? ColorConstant.green : ColorConstant.red,
                              ),
                              UIHelper.horizontalSpace(10),
                              Expanded(
                                child: Text(
                                  state.showErrorMsg ?? 'Press calculate button to get the result',
                                  style: context.textTheme.bodySmall?.copyWith(
                                    color: !state.isError ? ColorConstant.grey : ColorConstant.red,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  UIHelper.verticalSpace(20),
                  Text(
                    'HISTORY',
                    style: context.textTheme.headlineSmall?.copyWith(
                      color: ColorConstant.green,
                    ),
                  ),
                  UIHelper.verticalSpace(10),
                  state.ent.histories.isEmpty
                      ? Text(
                          'No history found',
                          style: context.textTheme.bodySmall?.copyWith(
                            color: ColorConstant.grey,
                            fontStyle: FontStyle.italic,
                          ),
                        )
                      : Column(
                          children: state.ent.histories
                              .map((history) => Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            state.historyText(history),
                                            style: context.textTheme.displayLarge,
                                          ),
                                          const Spacer(),
                                          InkWell(
                                            onTap: () => context.read<CalculatorCubit>().restoreHistory(history),
                                            child: Text(
                                              'Re-Apply',
                                              style: context.textTheme.bodySmall?.copyWith(
                                                color: ColorConstant.primary,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      UIHelper.divider(),
                                    ],
                                  ))
                              .toList(),
                        )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
