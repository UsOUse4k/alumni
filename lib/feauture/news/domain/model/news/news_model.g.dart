// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) => NewsModel(
      total: json['total'] as int?,
      news: (json['results'] as List<dynamic>?)
          ?.map((e) => News.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NewsModelToJson(NewsModel instance) => <String, dynamic>{
      'total': instance.total,
      'results': instance.news,
    };

News _$NewsFromJson(Map<String, dynamic> json) => News(
      id: json['id'] as String?,
      title: json['title'] as String?,
      poster: json['poster'] as String?,
      shortDescribe: json['shortDescribe'] as String?,
      content: (json['content'] as List<dynamic>?)
          ?.map((e) => Content.fromJson(e as Map<String, dynamic>))
          .toList(),
      newsImages: (json['newsImages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      lastUpdate: json['lastUpdate'] as String?,
      updatedBy: json['updatedBy'] as String?,
    );

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'poster': instance.poster,
      'shortDescribe': instance.shortDescribe,
      'content': instance.content,
      'newsImages': instance.newsImages,
      'lastUpdate': instance.lastUpdate,
      'updatedBy': instance.updatedBy,
    };

Content _$ContentFromJson(Map<String, dynamic> json) => Content(
      title: json['title'] as String?,
      paragraph: json['paragraph'] as String?,
      sId: json['sId'] as String?,
    );

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'title': instance.title,
      'paragraph': instance.paragraph,
      'sId': instance.sId,
    };
