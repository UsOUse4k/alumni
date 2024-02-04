import 'package:alumni/app/navigation/route.gr.dart';
import 'package:alumni/core/admin.dart';
import 'package:alumni/core/theme/a_fonts.dart';
import 'package:alumni/core/widget/custom_back_button.dart';
import 'package:alumni/feauture/news/domain/model/news_detail/news_detail_model.dart';
import 'package:alumni/feauture/news/presentation/bloc/news_bloc/news_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class NewsDetailScreen extends StatefulWidget {
  const NewsDetailScreen({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  NewsDetailModel? newsDetailModel;

  @override
  void initState() {
    context.read<NewsBloc>().add(GetDetailNewsEvent(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<NewsBloc, NewsState>(
        listener: (context, state) {
          if (state is NewsDetailSuccess) {
            newsDetailModel = state.newsDetailModel;
          }
        },
        builder: (context, state) {
          if (state is NewsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 250,
                pinned: true,
                backgroundColor: const Color(0xFF0e1111),
                leading: const CustomBackButton(),
                actions: [
                  Visibility(
                    visible: Admin.isAdmin ?? false ? true : false,
                    child: IconButton(
                      onPressed: () {
                        context.router.push(
                          UpdateNewsRoute(newsDetailModel: newsDetailModel),
                        );
                      },
                      icon: SvgPicture.asset(
                        'assets/images/edit.svg',
                      ),
                    ),
                  )
                ],
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: const EdgeInsets.only(left: 15, bottom: 12),
                  background: CachedNetworkImage(
                    imageUrl: newsDetailModel?.poster ?? '',
                    errorWidget: (context, _, __) => const Icon(Icons.error),
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          newsDetailModel?.title ?? '',
                          style: AFonts.h2i18,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          newsDetailModel?.shortDescribe ?? '',
                          style: AFonts.r0i15,
                        ),
                      ],
                    ),
                  )
                ]),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const SizedBox(
                      height: 5,
                    ),
                    Visibility(
                      visible: newsDetailModel?.newsImages?.isNotEmpty ?? false
                          ? true
                          : false,
                      child: SizedBox(
                        height: 220,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: newsDetailModel?.newsImages?.length ?? 0,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 5, left: 5),
                              child: Container(
                                height: 200,
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: CachedNetworkImageProvider(
                                      newsDetailModel?.newsImages?[index] ?? '',
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: newsDetailModel?.content?.length ?? 0,
                  (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            newsDetailModel?.content?[index].title ?? '',
                            style: AFonts.h2i18,
                          ),
                          Text(
                            newsDetailModel?.content?[index].paragraph ?? '',
                            style: AFonts.r0i15,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
