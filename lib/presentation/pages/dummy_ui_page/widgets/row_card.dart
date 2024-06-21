import 'package:flutter/material.dart';
import 'package:student_lecture_app/core/commons/colors_const.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/ui_helper.dart';

class RowCard extends StatelessWidget {
  final int index;
  final String imgSrc;
  const RowCard({
    super.key,
    required this.index,
    required this.imgSrc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UIHelper.padding(all: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorConstant.lightGrey,
        ),
        borderRadius: UIHelper.borderRadiusCircular(all: 10),
      ),
      child: Column(
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
          Text('${index + 1} image')
        ],
      ),
    );
  }
}
