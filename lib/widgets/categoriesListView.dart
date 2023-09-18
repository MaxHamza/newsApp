import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/get_news_cubit.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/views/category_view.dart';
import '../models/category_model.dart';
import 'category.dart';
import 'package:flutter_avif/flutter_avif.dart';
class CategoriesListView extends StatefulWidget {
  const CategoriesListView({Key? key, required this.state}) : super(key: key);
 final GetNewsState state;

  @override
  State<CategoriesListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
String current='general';
  @override
  Widget build(BuildContext context) {
  var ca=  BlocProvider.of<GetNewsCubit>(context).ca();
    return SizedBox(
      height: 110,
      child: ListView.builder(
          physics:const BouncingScrollPhysics(),
            shrinkWrap: true,//this influences on performance
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index){
              return  GestureDetector(
                  onTap: (){
                  current= ca[index].categoryName;
                   setState(() {});
                    Navigator.of(context).push(MaterialPageRoute(builder:(context){
                      return  CategoryView(state:widget.state,ca:current);
                    }));
                  },
                  child: Category(image:ca[index] ,text:ca[index]));
            },
            itemCount:ca.length,),
    );
  }
}
