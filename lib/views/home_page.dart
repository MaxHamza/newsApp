import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/get_news_cubit.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/widgets/categoriesListView.dart';
import 'package:news_app/widgets/category.dart';
import 'package:news_app/widgets/list_tile.dart';
import 'package:news_app/widgets/news_list_view.dart';

import '../models/article_model.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  dynamic future;
  @override
  void initState() {
   future= BlocProvider.of<GetNewsCubit>(context).getNews('general');
    super.initState();
  }
  Widget build(BuildContext context) {
    List<ArticleModel>a = BlocProvider.of<GetNewsCubit>(context).articles;

    return  FutureBuilder<dynamic>(
      future: future,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            title: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('News', style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                ),
                Text('Cloud', style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                )
              ],
            ),
          ),
          body: BlocConsumer<GetNewsCubit, GetNewsState>(
            listener: (context, state) {
              if (state is GetNewsSuccess) {
              //  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Center(child: Text('Success'))));
              }
              if (state is GetNewsFailure) {
                // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('oops there was an error,try later')));
              }
            },
            builder: (context, state) {
              return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: NewsListView(a: a, state: state,)
              );
            },
          ),
        );
      });
      }
}
