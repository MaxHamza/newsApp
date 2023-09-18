import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/get_news_cubit.dart';
import 'package:news_app/models/article_model.dart';

import '../widgets/list_tile.dart';

class CategoryView extends StatefulWidget{
  const CategoryView({super.key, required this.state, required this.ca});
final GetNewsState state;
final String ca;
  @override
  State<CategoryView> createState() => _CategoryViewState();
}
class _CategoryViewState extends State<CategoryView> {
  dynamic future;
  @override
  void initState() {
   future= BlocProvider.of<GetNewsCubit>(context).getNews(widget.ca);
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    List<ArticleModel>a= BlocProvider.of<GetNewsCubit>(context).articles;
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.all(20),
        child: BlocConsumer<GetNewsCubit, GetNewsState>(
  listener: (context, state) {
    if (state is GetNewsSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Center(child: Text('Success'))));
    }
    if (state is GetNewsFailure) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('oops there was an error,try later')));
    }
  },
  builder: (context, state) {
    return CustomScrollView(physics:const BouncingScrollPhysics(),
            slivers: [
              state is GetNewsLoading
                  ? const SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()))
                  : SliverList(
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
            ]
        );
  },
),
      ));
  }
}
