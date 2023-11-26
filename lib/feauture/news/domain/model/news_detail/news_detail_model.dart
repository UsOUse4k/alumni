import 'package:json_annotation/json_annotation.dart';

part 'news_detail_model.g.dart';

@JsonSerializable()
class NewsDetailModel {
  String? id;
  String? title;
  String? poster;
  String? shortDescribe;
  List<Content>? content;
  List<String>? newsImages;
  String? lastUpdate;
  String? updatedBy;

  NewsDetailModel(
      {this.id,
        this.title,
        this.poster,
        this.shortDescribe,
        this.content,
        this.newsImages,
        this.lastUpdate,
        this.updatedBy,});

 factory NewsDetailModel.fromJson(Map<String,dynamic> json) => _$NewsDetailModelFromJson(json);


}
@JsonSerializable()
class Content {
  String? title;
  String? paragraph;
  String? sId;

  Content({this.title, this.paragraph, this.sId});

  factory Content.fromJson(Map<String,dynamic> json) => _$ContentFromJson(json);


}
