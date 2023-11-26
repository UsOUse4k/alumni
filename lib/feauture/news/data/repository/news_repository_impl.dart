import 'package:alumni/feauture/news/data/source/remote/news_api_data_source.dart';
import 'package:alumni/feauture/news/domain/model/create_news/create_news.dart';
import 'package:alumni/feauture/news/domain/model/news/news_model.dart';
import 'package:alumni/feauture/news/domain/model/news_detail/news_detail_model.dart';
import 'package:alumni/feauture/news/domain/repository/news_repository.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/error_utils.dart';

class NewsRepositoryImpl extends NewsRepository {
  NewsRepositoryImpl(this.newsApiDataSource);

  final NewsApiDataSource newsApiDataSource;

  @override
  Future<NewsModel> getAllNews(int limit, int offset) async {
    try {
      final result = await newsApiDataSource.getAllNews(limit, offset);
      return result;
    } on DioException catch (e) {
      throw showError(e.response?.data['message']);
    }
  }

  @override
  Future<NewsDetailModel> getDetailNews(String newsId) async {
    try {
      final result = await newsApiDataSource.getDetailNews(newsId);
      return result;
    } on DioException catch (e) {
      throw showError(e.response?.data['message']);
    }
  }

  @override
  Future<bool> createNews(CreateNewsModel createNews) async {
    try {
      final result = await newsApiDataSource.createNews(createNews);
      return result;
    } on DioException catch (e) {
      throw showError(e.response?.data['message']);
    }
  }

  @override
  Future<bool> updateNews(CreateNewsModel createNews, String newsId) async {
    try {
      final result = await newsApiDataSource.updateNews(createNews, newsId);
      return result;
    } on DioException catch (e) {
      throw showError(e.response?.data['message']);
    }
  }

  @override
  Future<bool> deleteNews(String newsId) async {
    try {
      final result = await newsApiDataSource.deleteNews(newsId);
      return result;
    } on DioException catch (e) {
      throw showError(e.response?.data['message']);
    }
  }
}
