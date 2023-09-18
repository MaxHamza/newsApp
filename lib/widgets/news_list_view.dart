import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/get_news_cubit.dart';
import '../models/article_model.dart';
import 'categoriesListView.dart';
import 'list_tile.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({Key? key, required this.a,required this.state}) : super(key: key);

  final List<ArticleModel> a;
final GetNewsState state;
  @override
  Widget build(BuildContext context){
    return CustomScrollView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      slivers: [
         SliverToBoxAdapter(child: CategoriesListView(state:state,)),
        const SliverToBoxAdapter(child: SizedBox(height: 32)),
           state is GetNewsLoading ? const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator())) :SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return ListNews(
                title: a[index].title,
                image: a[index].image,
                subtitle: a[index].subtitle,
              );
            },
              childCount: a.length,
            ),
          ),
      ],
    );
  }
}
