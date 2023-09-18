import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/models/category_model.dart';
import '../cubits/get_news_cubit.dart';
class Category extends StatelessWidget {
  const Category({Key? key, required this.image, required this.text}) : super(key: key);
  final CategoryModel image;
  final CategoryModel text;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Container(
          height: 60,
          width: 160,
          decoration: BoxDecoration(
            image:DecorationImage(image:  AssetImage(image.categoryImage,),
              fit: BoxFit.fill,
            ),
            borderRadius:const BorderRadius.all(Radius.circular(10)),
          ),
          child:Center(child: Text(text.categoryName,style:const TextStyle(
            color:Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          )))
      ),
    );
  }
}
