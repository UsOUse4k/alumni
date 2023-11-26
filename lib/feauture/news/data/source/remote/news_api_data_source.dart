import 'package:alumni/feauture/news/data/data_source/news_data_source.dart';
import 'package:alumni/feauture/news/domain/model/create_news/create_news.dart';
import 'package:alumni/feauture/news/domain/model/news/news_model.dart';
import 'package:alumni/feauture/news/domain/model/news_detail/news_detail_model.dart';
import 'package:dio/dio.dart';

class NewsApiDataSource {
  NewsApiDataSource(this.newsDataSource);

  final NewsDataSource newsDataSource;

  Future<NewsModel> getAllNews(int limit, int offset) async {
    Response response = await newsDataSource.getAllNews(limit, offset);

    if (response.statusCode == 200) {
      return NewsModel.fromJson(response.data);
    } else if (response.statusCode! >= 400) {
      throw Exception('Error');
    } else {
      throw Exception('Error');
    }
  }

  Future<NewsDetailModel> getDetailNews(String newsId) async {
    Response response = await newsDataSource.getDetailNews(newsId);

    if (response.statusCode == 200) {
      return NewsDetailModel.fromJson(response.data);
    } else if (response.statusCode! >= 400) {
      throw Exception('Error');
    } else {
      throw Exception('Error');
    }
  }

  Future<bool> createNews(CreateNewsModel createNews) async {
    Response response = await newsDataSource.createNew(createNews);

    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode! >= 400) {
      throw Exception('Error');
    } else {
      throw Exception('Error');
    }
  }

  Future<bool> deleteNews(String newsId) async {
    Response response = await newsDataSource.deleteNews(newsId);

    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode! >= 400) {
      throw Exception('Error');
    } else {
      throw Exception('Error');
    }
  }

  Future<bool> updateNews(CreateNewsModel createNews, String newsId) async {
    Response response = await newsDataSource.updateNews(createNews, newsId);

    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode! >= 400) {
      throw Exception('Error');
    } else {
      throw Exception('Error');
    }
  }
}
