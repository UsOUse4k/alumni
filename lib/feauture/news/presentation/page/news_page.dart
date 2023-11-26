import 'package:alumni/app/navigation/route.gr.dart';
import 'package:alumni/feauture/news/domain/model/news/news_model.dart';
import 'package:alumni/feauture/news/presentation/bloc/news_bloc/news_bloc.dart';
import 'package:alumni/feauture/news/presentation/widget/new_loading.dart';
import 'package:alumni/feauture/news/presentation/widget/news_app_bar.dart';
import 'package:alumni/feauture/news/presentation/widget/news_background.dart';
import 'package:alumni/feauture/news/presentation/widget/news_card.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage>
    with AutomaticKeepAliveClientMixin {
  NewsModel? newsModel;
  late DraggableScrollableController draggableScrollableController;

  bool isPaginate = false;
  int limit = 10;
  int offset = 0;

  ValueNotifier<double> currentOpacity = ValueNotifier(0);

  @override
  void initState() {
    draggableScrollableController = DraggableScrollableController();
    draggableScrollableController.addListener(increaseOpacity);
    context.read<NewsBloc>().add(GetAllNewsEvent(offset, limit));
    super.initState();
  }

  void increaseOpacity() {
    if (draggableScrollableController.size == 0.50) {
      currentOpacity.value = 0;
    } else {
      currentOpacity.value =
          ((draggableScrollableController.size / 0.70) / 1.5);
    }
  }

  @override
  void dispose() {
    draggableScrollableController.removeListener(increaseOpacity);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicator(
      onRefresh: () async {
        context.read<NewsBloc>().add(GetAllNewsEvent(offset, limit));
      },
      child: Scaffold(
          backgroundColor: const Color(0xFFF5F5F5),
          body: Stack(
            children: [
              Positioned(
                top: 50,
                right: 0,
                left: 0,
                child: NewsBackground(
                  onPressed: () {
                    context.router.push(
                      NewsDetailRoute(
                        id: newsModel?.news?.last.id ?? '',
                      ),
                    );
                  },
                ),
              ),
              Positioned.fill(
                child: IgnorePointer(
                  child: ValueListenableBuilder(
                    valueListenable: currentOpacity,
                    builder: (BuildContext context, value, Widget? child) {
                      return AnimatedOpacity(
                        opacity: value,
                        duration: const Duration(milliseconds: 150),
                        child: Container(
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                ),
              ),
              BlocConsumer<NewsBloc, NewsState>(
                listener: (context, state) {
                  if (state is NewsSuccess) {
                    newsModel = state.newsModel;
                  }
                },
                builder: (context, state) {
                  if (state is NewsLoading) {
                    return const NewsLoadingCard();
                  }
                  return Positioned.fill(
                    child: DraggableScrollableSheet(
                      minChildSize: 0.50,
                      controller: draggableScrollableController,
                      initialChildSize: 0.50,
                      maxChildSize: 0.98,
                      builder: (context, scrollController) {
                        return CustomScrollView(
                          controller: scrollController,
                          slivers: [
                            SliverList(
                              delegate: SliverChildBuilderDelegate(
                                childCount: newsModel?.news?.length ?? 0,
                                (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 10,
                                    ),
                                    child: NewsCard(
                                      news: newsModel?.news?[index],
                                      onCall: () {
                                        currentOpacity.value = 0;
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                            SliverList(
                                delegate: SliverChildListDelegate([
                                  (newsModel?.total ?? 0) >= 10
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          offset != 0
                                              ? FilledButton(
                                                  onPressed: () {
                                                    backward();
                                                  },
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(const Color(
                                                                  0xFF153964))),
                                                  child: const Text(
                                                    'Назад',
                                                  ),
                                                )
                                              : const SizedBox(),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          FilledButton(
                                            onPressed: () {
                                              forward();
                                            },
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        const Color(
                                                            0xFF153964))),
                                            child: const Text(
                                              'Вперед',
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : const SizedBox()
                            ]))
                          ],
                        );
                      },
                    ),
                  );
                },
              ),
              const Positioned(
                right: 0,
                left: 0,
                child: NewsAppBar(),
              ),
            ],
          )),
    );
  }

  void forward() {
    offset += 1;
    print(offset);
    context.read<NewsBloc>().add(GetAllNewsEvent(offset, limit));
    isPaginate = true;
  }

  void backward() {
    offset -= 1;
    print(offset);
    context.read<NewsBloc>().add(GetAllNewsEvent(offset, limit));
    isPaginate = true;
  }

  @override
  bool get wantKeepAlive => true;
}
