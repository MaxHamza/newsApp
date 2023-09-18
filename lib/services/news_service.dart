import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';


class NewsApi{
  final dio= Dio();
//final String category;
//NewsApi({required this.category});
//  Future<List<ArticleModel>> getNews()async{
//   Response response=await dio.get('https://newsapi.org/v2/top-headlines?country=us&apiKey=51fb4fc88e914a398527d9dbba5b4a13&category=$category');
//   Map<String,dynamic>jsonData=response.data;
//   List<dynamic>articles=jsonData['articles'];
//   List<ArticleModel>article=[];
//   for(dynamic article in articles ){
//    ArticleModel articleModel= ArticleModel(subtitle:article['description'],image:article['urlToImage'] ,title: article['title']);
//     article.add(articleModel);
//   }
//   return article;
// }

}