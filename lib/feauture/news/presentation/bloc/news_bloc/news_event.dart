part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();
}

class GetAllNewsEvent extends NewsEvent {
  const GetAllNewsEvent(this.offset, this.limit);

  final int offset;
  final int limit;

  @override
  List<Object?> get props => [offset, limit];
}

class GetDetailNewsEvent extends NewsEvent {
  const GetDetailNewsEvent(this.newsId);

  final String newsId;

  @override
  List<Object?> get props => [newsId];
}

class DeleteNewsEvent extends NewsEvent {
  const DeleteNewsEvent(this.newsId);

  final String newsId;

  @override
  List<Object?> get props => [newsId];
}

class CreateNewsEvent extends NewsEvent {
  const CreateNewsEvent(this.createNewsModel);

  final CreateNewsModel createNewsModel;

  @override
  List<Object?> get props => [createNewsModel];
}

class UpdateNewsEvent extends NewsEvent {
  const UpdateNewsEvent(this.createNewsModel, this.newsId);

  final CreateNewsModel createNewsModel;
  final String newsId;

  @override
  List<Object?> get props => [createNewsModel,newsId];
}

