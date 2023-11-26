import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:json_annotation/json_annotation.dart';
part 'create_news.g.dart';

class CreateNewsModel {
  final File? poster;
  final String title;
  final String paragraph;
  final List<Content> content;
  final List<XFile?> images;

  CreateNewsModel(
      {required this.poster,
      required this.title,
      required this.paragraph,
      required this.content,
      required this.images});

}

@JsonSerializable()
class Content {
  final String title;
  final String paragraph;

  Content({required this.title, required this.paragraph});

  factory Content.fromJson(Map<String, dynamic> json) => _$ContentFromJson(json);
 Map<String, dynamic> toJson() => _$ContentToJson(this);
}

