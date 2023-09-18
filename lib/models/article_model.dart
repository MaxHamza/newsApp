class ArticleModel{
final String  ?title;
final String ?subtitle;
final String ?image;

ArticleModel({required this.image,required this.title,required this.subtitle});

 factory ArticleModel.jsonData(jsonData){
 return  ArticleModel(title:jsonData['title'],
     image:jsonData['urlToImage'],subtitle:jsonData['description']);
 }

}