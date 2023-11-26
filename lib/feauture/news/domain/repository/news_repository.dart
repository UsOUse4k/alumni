import 'package:alumni/feauture/news/domain/model/create_news/create_news.dart';
import 'package:alumni/feauture/news/domain/model/news/news_model.dart';
import 'package:alumni/feauture/news/domain/model/news_detail/news_detail_model.dart';

abstract class NewsRepository {
  Future<NewsModel> getAllNews(int limit, int offset);
  Future<NewsDetailModel> getDetailNews(String newsId);
  Future<bool> deleteNews(String newsId);
  Future<bool> createNews(CreateNewsModel createNews);
  Future<bool> updateNews(CreateNewsModel createNews,String newsId);
}
