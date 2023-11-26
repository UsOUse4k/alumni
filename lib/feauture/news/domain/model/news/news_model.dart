import 'package:json_annotation/json_annotation.dart';

part 'news_model.g.dart';

@JsonSerializable()
class NewsModel {
  int? total;
  @JsonKey(name: 'results')
  List<News>? news;

  NewsModel({this.total, this.news});

  factory NewsModel.fromJson(Map<String, dynamic> json) => _$NewsModelFromJson(json);

}

@JsonSerializable()
class News {
  String? id;
  String? title;
  String? poster;
  String? shortDescribe;
  List<Content>? content;
  List<String>? newsImages;
  String? lastUpdate;
  String? updatedBy;

  News(
      {this.id,
        this.title,
        this.poster,
        this.shortDescribe,
        this.content,
        this.newsImages,
        this.lastUpdate,
        this.updatedBy});

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);


}

@JsonSerializable()
class Content {
  String? title;
  String? paragraph;
  String? sId;

  Content({this.title, this.paragraph, this.sId});

  factory Content.fromJson(Map<String, dynamic> json) => _$ContentFromJson(json);


}
