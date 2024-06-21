import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_lecture_app/core/commons/colors_const.dart';
import 'package:student_lecture_app/core/commons/constants.dart';
import 'package:student_lecture_app/core/routes/app_router.gr.dart';
import 'package:student_lecture_app/presentation/pages/dummy_ui_page/widgets/row_card.dart';
import 'package:student_lecture_app/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:student_lecture_app/presentation/widgets/molecules/action_text.dart';
import 'package:student_lecture_app/presentation/widgets/molecules/platform_app_bar.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/news_card.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/text_form_field.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/ui_helper.dart';

@RoutePage()
class DummyUIStep1Page extends StatelessWidget {
  const DummyUIStep1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PlatformAppBar(
        title: Text('Dummy UI'),
      ),
      body: SingleChildScrollView(
        padding: UIHelper.padding(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ActionText(
              onTap: () {
                AutoRouter.of(context).push(const DummyUIStep2Route());
              },
              title: 'Next',
              desc: 'Tab Bar, Grid View, List View',
              needDivider: false,
            ),
            UIHelper.verticalSpace(15),
            Text(
              'CONTAINER AND TEXT',
              style: context.textTheme.headlineMedium?.copyWith(
                color: ColorConstant.green,
              ),
            ),
            UIHelper.verticalSpace(10),
            NewsCard(
              imgSrc: Constants.dummyImg,
              title: 'How can I be Flutter Developer Expert?',
              desc: 'Jill Lepore \u2022 23 May 23',
            ),
            UIHelper.verticalSpace(5),
            Text(
              'COLUMN',
              style: context.textTheme.headlineMedium?.copyWith(
                color: ColorConstant.green,
              ),
            ),
            UIHelper.verticalSpace(10),
            ...List.generate(
              2,
              (index) => NewsCard(
                imgSrc: Constants.dummyImg,
                title: 'How can I be Flutter Developer Expert?',
                desc: 'Jill Lepore \u2022 23 May 23',
              ),
            ),
            UIHelper.verticalSpace(5),
            Text(
              'ROW',
              style: context.textTheme.headlineMedium?.copyWith(
                color: ColorConstant.green,
              ),
            ),
            UIHelper.verticalSpace(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                3,
                (index) => RowCard(
                  index: index,
                  imgSrc: Constants.dummyImg,
                ),
              ),
            ),
            UIHelper.verticalSpace(15),
            Text(
              'BUTTON',
              style: context.textTheme.headlineMedium?.copyWith(
                color: ColorConstant.green,
              ),
            ),
            UIHelper.verticalSpace(10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Press Me'),
              ),
            ),
            UIHelper.verticalSpace(15),
            Text(
              'INPUT',
              style: context.textTheme.headlineMedium?.copyWith(
                color: ColorConstant.green,
              ),
            ),
            UIHelper.verticalSpace(10),
            TextFormFieldCustom(
              onChange: (val) {
                print(val);
              },
              title: 'Email',
              preffixIcon: const Icon(Icons.email_outlined),
              hintText: 'Enter your email....',
            ),
            UIHelper.verticalSpace(15),
            Text(
              'IMAGE ASSET, SIZED BOX & EXPANDED',
              style: context.textTheme.headlineMedium?.copyWith(
                color: ColorConstant.green,
              ),
            ),
            UIHelper.verticalSpace(10),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: RowCard(index: 0, imgSrc: Constants.dummyImg),
                ),
                UIHelper.horizontalSpace(20),
                Expanded(
                  flex: 1,
                  child: RowCard(index: 1, imgSrc: Constants.dummyImg),
                ),
              ],
            ),
            UIHelper.verticalSpace(30),
          ],
        ),
      ),
    );
  }
}
