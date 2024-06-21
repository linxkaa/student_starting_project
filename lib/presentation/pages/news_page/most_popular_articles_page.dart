import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_lecture_app/infrastructure/common/dtos/article_model.dart';
import 'package:student_lecture_app/presentation/widgets/molecules/platform_app_bar.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/news_card.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/ui_helper.dart';

@RoutePage()
class MostPopularArticlesPage extends StatelessWidget {
  final List<ArticleModel> articles;
  const MostPopularArticlesPage({
    super.key,
    required this.articles,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PlatformAppBar(
        title: Text('Most Popular Articles'),
      ),
      body: SingleChildScrollView(
        padding: UIHelper.padding(horizontal: 20, vertical: 10),
        child: Column(
          children: List.generate(
            articles.length,
            (index) {
              final data = articles[index];
              return NewsCard(
                title: data.title,
                imgSrc: data.multimediaConverted,
                desc: '${data.byline} \u2022 ${data.publishedDateConverted}',
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
