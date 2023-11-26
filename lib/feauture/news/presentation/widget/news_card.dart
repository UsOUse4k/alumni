import 'package:alumni/app/navigation/route.gr.dart';
import 'package:alumni/core/theme/a_color.dart';
import 'package:alumni/feauture/news/domain/model/news/news_model.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({Key? key, required this.news, required this.onCall}) : super(key: key);

  final News? news;
  final Function() onCall;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.push(
          NewsDetailRoute(id: news?.id ?? ''),
        ).then((value) {
          onCall.call();
        });
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: NeutralColor.white, borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: Container(
                width: 150,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      news?.poster ?? '',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SizedBox(
                width: 190,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '${news?.title}',
                      maxLines: 2,
                      style: const TextStyle(
                          fontSize: 17,
                          fontFamily: 'Intro',
                          fontWeight: FontWeight.w700,
                          color: NeutralColor.primary),
                    ),
                    Text(
                      '${news?.shortDescribe}',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      DateFormat('dd.MM.yyyy').format(DateTime.parse(news?.lastUpdate ?? DateTime.now().toString())),
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF606060)),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
