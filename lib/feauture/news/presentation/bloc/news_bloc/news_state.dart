part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsDeleteSuccess extends NewsState {}

class NewsSuccess extends NewsState {
  const NewsSuccess(this.newsModel);
  final NewsModel newsModel;

  @override
  List<Object> get props => [newsModel];
}

class CreateNewsSuccess extends NewsState {
  const CreateNewsSuccess();

  @override
  List<Object> get props => [];
}

class UpdateNewsSuccess extends NewsState {
  const UpdateNewsSuccess();

  @override
  List<Object> get props => [];
}

class NewsDetailSuccess extends NewsState {
  const NewsDetailSuccess(this.newsDetailModel);

  final NewsDetailModel newsDetailModel;

  @override
  List<Object> get props => [newsDetailModel];
}

class NewsError extends NewsState {
  const NewsError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
