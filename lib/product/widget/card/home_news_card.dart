import 'package:firebase_full_news_app/product/constants/color_constants.dart';
import 'package:firebase_full_news_app/product/enums/widget_size.dart';
import 'package:firebase_full_news_app/product/model/news.dart';
import 'package:firebase_full_news_app/product/widget/text/sub_title_text.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class HomeNewsCard extends StatelessWidget {
  const HomeNewsCard({
    super.key,
    this.newsItem,
  });

  final News? newsItem;
  @override
  Widget build(BuildContext context) {
    if (newsItem == null) return const SizedBox.shrink();
    return Stack(
      children: [
        Padding(
          padding: context.padding.onlyRightLow,
          child: Image.network(
            newsItem!.backgroundImage ?? '',
            errorBuilder: (context, error, stackTrace) => const Placeholder(),
          ),
        ),
        Positioned.fill(
          child: Padding(
            padding: context.padding.low,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.bookmark_outline,
                    color: ColorConstants.white,
                    size: WidgetSize.iconNormal.value.toDouble(),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: context.padding.low,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SubTitleText(
                        value: newsItem!.category ?? '',
                        color: ColorConstants.greyLighter,
                      ),
                      Text(
                        newsItem?.title ?? '',
                        style: context.general.textTheme.titleLarge?.copyWith(
                          color: ColorConstants.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
