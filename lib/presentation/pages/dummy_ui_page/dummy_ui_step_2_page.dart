import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_lecture_app/core/commons/constants.dart';
import 'package:student_lecture_app/presentation/pages/dummy_ui_page/widgets/row_card.dart';
import 'package:student_lecture_app/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:student_lecture_app/presentation/widgets/molecules/platform_app_bar.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/news_card.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/ui_helper.dart';

@RoutePage()
class DummyUIStep2Page extends StatefulWidget {
  const DummyUIStep2Page({super.key});

  @override
  State<DummyUIStep2Page> createState() => _DummyUIStep2PageState();
}

class _DummyUIStep2PageState extends State<DummyUIStep2Page> with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(vsync: this, length: 2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PlatformAppBar(
        appBarSize: UIHelper.setSp(100),
        title: const Text('Dummy UI'),
        bottom: TabBar(
          controller: controller,
          //source code lanjutan
          tabs: <Widget>[
            Padding(
              padding: UIHelper.padding(bottom: 5),
              child: Text(
                'ListView',
                style: context.textTheme.headlineSmall,
              ),
            ),
            Padding(
              padding: UIHelper.padding(bottom: 5),
              child: Text(
                'GridView',
                style: context.textTheme.headlineSmall,
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          Padding(
            padding: UIHelper.padding(vertical: 10, horizontal: 15),
            child: ListView.builder(
              itemBuilder: (context, index) => NewsCard(
                imgSrc: Constants.dummyImg,
                title: 'How can I be Flutter Developer Expert 1?',
                desc: 'Jill Lepore \u2022 23 May 2023',
              ),
              itemCount: 10,
            ),
          ),
          Padding(
            padding: UIHelper.padding(vertical: 10, horizontal: 15),
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1.3,
              children: List.generate(9, (index) {
                return RowCard(
                  imgSrc: Constants.dummyImg,
                  index: index,
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
