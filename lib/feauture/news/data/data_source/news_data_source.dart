import 'dart:io';

import 'package:alumni/core/network/dio_setting.dart';
import 'package:alumni/feauture/news/domain/model/create_news/create_news.dart';
import 'package:dio/dio.dart';

class NewsDataSource {
  NewsDataSource({required this.dioSetting});

  final DioSetting dioSetting;

  Future<Response> getAllNews(int limit, int offset) async {
    return dioSetting.dio.get('/api/news?limit=$limit&page=$offset');
  }

  Future<Response> getDetailNews(String newsId) async {
    return dioSetting.dio.get('/api/news/$newsId');
  }

  Future<Response> deleteNews(String newsId) async {
    return dioSetting.dio.delete('/api/news/delete-news/$newsId');
  }

  Future<Response> updateNews(
      CreateNewsModel createNewsModel, String newsId) async {
    List<MultipartFile> newsImage = [];
    List<Map<String, dynamic>> contentList = [];

    await Future.wait(
      createNewsModel.images.map(
        (e) async {
          newsImage.add(await MultipartFile.fromFile(File(e!.path).path));
        },
      ),
    );

    await Future.wait(
      createNewsModel.content.map(
        (e) async {
          contentList.add(e.toJson());
        },
      ),
    );

    FormData newsFormData = FormData.fromMap({
      'title': createNewsModel.title,
      'shortDescribe': createNewsModel.paragraph,
      'newsImages': newsImage,
      'content': contentList,
    });

    if (createNewsModel.poster != null) {
      newsFormData.files.add(
        MapEntry(
          'posters',
          await MultipartFile.fromFile(File(createNewsModel.poster!.path).path),
        ),
      );
    }

    return dioSetting.dio.put(
      '/api/news/update-news/$newsId',
      data: newsFormData,
    );
  }

  Future<Response> createNew(CreateNewsModel createNewsModel) async {
    List<MultipartFile> newsImage = [];
    List<Map<String, dynamic>> contentList = [];

    await Future.wait(
      createNewsModel.images.map(
        (e) async {
          newsImage.add(await MultipartFile.fromFile(File(e!.path).path));
        },
      ),
    );

    await Future.wait(
      createNewsModel.content.map(
        (e) async {
          contentList.add(e.toJson());
        },
      ),
    );

    FormData newsFormData = FormData.fromMap({
      'title': createNewsModel.title,
      'shortDescribe': createNewsModel.paragraph,
      'posters': await MultipartFile.fromFile(createNewsModel.poster!.path),
      'newsImages': newsImage,
      'content': contentList,
    });

    return dioSetting.dio.post('/api/news/create-news', data: newsFormData);
  }
}
