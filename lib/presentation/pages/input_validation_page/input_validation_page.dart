import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_lecture_app/application/input_validation_cubit/input_validation_cubit.dart';
import 'package:student_lecture_app/core/commons/colors_const.dart';
import 'package:student_lecture_app/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:student_lecture_app/presentation/widgets/molecules/platform_app_bar.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/text_form_field.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/ui_helper.dart';

@RoutePage()
class InputValidationPage extends StatelessWidget {
  const InputValidationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InputValidationCubit(),
      child: Builder(builder: (context) {
        return Scaffold(
          bottomNavigationBar: Container(
            padding: UIHelper.padding(all: 10),
            child: ElevatedButton(
              onPressed: () => context.read<InputValidationCubit>().submit(),
              child: const Text('Submit'),
            ),
          ),
          appBar: const PlatformAppBar(
            title: Text('Input Validation Page'),
          ),
          body: SingleChildScrollView(
            padding: UIHelper.padding(vertical: 10, horizontal: 20),
            child: BlocBuilder<InputValidationCubit, InputValidationState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.title,
                      style: context.textTheme.headlineMedium?.copyWith(
                        color: ColorConstant.primary,
                      ),
                    ),
                    Text(
                      state.description,
                      style: context.textTheme.bodySmall?.copyWith(
                        color: ColorConstant.grey,
                      ),
                    ),
                    UIHelper.verticalSpace(30),
                    TextFormFieldCustom(
                      controller: context.read<InputValidationCubit>().nameController,
                      title: 'Name',
                      preffixIcon: const Icon(Icons.person_2_outlined),
                      hintText: 'Enter your name....',
                      validator: (_) => state.showNameErrorMsg,
                    ),
                    UIHelper.verticalSpace(20),
                    TextFormFieldCustom(
                      controller: context.read<InputValidationCubit>().emailController,
                      title: 'Email',
                      preffixIcon: const Icon(Icons.email_outlined),
                      hintText: 'Enter your email....',
                      validator: (_) => state.showEmailErrorMsg,
                    ),
                  ],
                );
              },
            ),
          ),
        );
      }),
    );
  }
}
