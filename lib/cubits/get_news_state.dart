part of 'get_news_cubit.dart';

abstract class GetNewsState {}

class GetNewsInitial extends GetNewsState {}
class GetNewsLoading extends GetNewsState {}
class GetNewsSuccess extends GetNewsState {}

class GetNewsFailure extends GetNewsState {
 final String error;
 GetNewsFailure(this.error);
}
