import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/models/article_model.dart';

import '../models/category_model.dart';
part 'get_news_state.dart';
class GetNewsCubit extends Cubit<GetNewsState> {
  GetNewsCubit() : super(GetNewsInitial());
  var dio = Dio();
  List<CategoryModel>ca() {
    List<CategoryModel>category =const[
      CategoryModel(
          categoryImage: 'assets/business.avif',
          categoryName:'entertainment' ),
      CategoryModel(categoryImage: 'assets/entertaiment.avif',
          categoryName: 'business'),
      CategoryModel(
          categoryImage: 'assets/general.avif',
          categoryName: 'general'),
      CategoryModel(
          categoryImage: 'assets/health.avif',
          categoryName: 'health'),
      CategoryModel(
          categoryImage: 'assets/science.avif',
          categoryName: 'science'),
      CategoryModel(
          categoryImage: 'assets/sports.avif',
          categoryName: 'sports'),
      CategoryModel(
          categoryImage: 'assets/technology.jpeg',
          categoryName: 'technology'),
    ];
    return category;
  }
  List<ArticleModel> articles=[];
  Future<dynamic>?getNews(String category) async {
      try {
        emit(GetNewsLoading());
        Response response = await dio.get(
            'https://newsapi.org/v2/top-headlines?country=us&apiKey=51fb4fc88e914a398527d9dbba5b4a13&category=$category');
        Map<String, dynamic> jsonData = response.data; //you have all data here
        List<dynamic> articleData = jsonData['articles'];
        clearArticle();
        for (var articleItem in articleData) {
          ArticleModel articleModel = ArticleModel.jsonData(articleItem);
          articles.add(articleModel);
        }
        emit(GetNewsSuccess());
        return articles;
      } catch (e) {
        emit(GetNewsFailure(e.toString()));
        return null;
      }
    }

        clearArticle(){
      articles.clear();
    }
}
