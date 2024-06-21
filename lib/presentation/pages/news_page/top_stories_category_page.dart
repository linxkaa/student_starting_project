import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_lecture_app/core/commons/colors_const.dart';
import 'package:student_lecture_app/core/commons/constants.dart';
import 'package:student_lecture_app/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:student_lecture_app/presentation/widgets/molecules/platform_app_bar.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/news_card.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/ui_helper.dart';

@RoutePage()
class TopStoriesCategoryPage extends StatelessWidget {
  final String title;
  const TopStoriesCategoryPage({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PlatformAppBar(
        title: Text('Category Page'),
      ),
      body: SingleChildScrollView(
        padding: UIHelper.padding(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'SECTION:',
                  style: context.textTheme.headlineSmall?.copyWith(
                    color: ColorConstant.grey,
                  ),
                ),
                Text(
                  title.toUpperCase(),
                  style: context.textTheme.headlineSmall?.copyWith(
                    color: ColorConstant.primary,
                  ),
                ),
              ],
            ),
            UIHelper.verticalSpace(20),
            Column(
              children: List.generate(
                5,
                (index) => NewsCard(
                  title: 'dummy data',
                  desc: 'dummy data juga',
                  imgSrc: Constants.dummyImg,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
