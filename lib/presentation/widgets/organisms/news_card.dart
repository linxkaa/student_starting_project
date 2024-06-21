import 'package:flutter/material.dart';
import 'package:student_lecture_app/core/commons/colors_const.dart';
import 'package:student_lecture_app/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/ui_helper.dart';

class NewsCard extends StatelessWidget {
  final String title;
  final String desc;
  final String imgSrc;
  const NewsCard({
    super.key,
    required this.title,
    required this.desc,
    required this.imgSrc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UIHelper.padding(all: 10),
      margin: UIHelper.padding(bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorConstant.lightGrey,
        ),
        borderRadius: UIHelper.borderRadiusCircular(all: 10),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: UIHelper.borderRadiusCircular(all: 10),
            child: Image.network(
              imgSrc,
              width: UIHelper.setSp(60),
              height: UIHelper.setSp(60),
              fit: BoxFit.cover,
            ),
          ),
          UIHelper.horizontalSpace(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                UIHelper.verticalSpace(10),
                Text(
                  desc,
                  style: context.textTheme.labelSmall?.copyWith(
                    color: ColorConstant.darkGrey,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
