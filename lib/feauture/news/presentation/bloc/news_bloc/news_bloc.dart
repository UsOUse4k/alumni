import 'package:alumni/feauture/news/domain/model/create_news/create_news.dart';
import 'package:alumni/feauture/news/domain/model/news/news_model.dart';
import 'package:alumni/feauture/news/domain/model/news_detail/news_detail_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/repository/news_repository.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository newsRepository;
  NewsBloc(this.newsRepository) : super(NewsInitial()) {
    on<GetAllNewsEvent>(getAllNews);
    on<GetDetailNewsEvent>(getDetailNews);
    on<CreateNewsEvent>(createNews);
    on<UpdateNewsEvent>(updateNews);
    on<DeleteNewsEvent>(deleteNews);
  }

  void getAllNews(GetAllNewsEvent event, Emitter emit) async {
    try {
      emit(NewsLoading());
      final news = await newsRepository.getAllNews(
        event.limit,
        event.offset,
      );
      emit(NewsSuccess(news));
    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }

  void deleteNews(DeleteNewsEvent event, Emitter emit) async {
    try {
      emit(NewsLoading());
      await newsRepository.deleteNews(
        event.newsId,
      );
      emit(NewsDeleteSuccess());
    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }

  void getDetailNews(GetDetailNewsEvent event, Emitter emit) async {
    try {
      emit(NewsLoading());
      final newsDetail = await newsRepository.getDetailNews(event.newsId);
      emit(NewsDetailSuccess(newsDetail));
    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }

  void createNews(CreateNewsEvent event, Emitter emit) async {
    try {
      emit(NewsLoading());
      await newsRepository.createNews(event.createNewsModel);
      emit(const CreateNewsSuccess());
    } catch (e, s) {
      print(e);
      print(s);
      emit(NewsError(e.toString()));
    }
  }

  void updateNews(UpdateNewsEvent event, Emitter emit) async {
    try {
      emit(NewsLoading());
      await newsRepository.updateNews(event.createNewsModel, event.newsId);
      emit(const UpdateNewsSuccess());
    } catch (e, s) {
      print(e);
      print(s);
      emit(NewsError(e.toString()));
    }
  }
}
