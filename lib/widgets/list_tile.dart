import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';

import '../cubits/get_news_cubit.dart';

class ListNews extends StatelessWidget {
  const ListNews({Key? key, required this.title, this.image, this.subtitle}) : super(key: key);
  final String? title;
  final String ?image;
  final String ?subtitle;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom:20.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius:const BorderRadius.all(Radius.circular(16)),
            child: Image.network(image??'https://image.shutterstock.com/image-photo/portrait-handsome-caucasian-man-formal-260nw-2142820441.jpg',
              fit: BoxFit.fill,
              height: 200,
            ),
          ),
          const  SizedBox(height: 5,),
          ListTile(title: Text(title??'qdw',
            style:const TextStyle(fontWeight: FontWeight.w500),maxLines: 3,textDirection:TextDirection.rtl,

          ),
            subtitle:Text(subtitle??'j',
              style: TextStyle(fontWeight: FontWeight.w700,
                  color:Colors.grey.withOpacity(0.5)),maxLines: 3,textDirection:TextDirection.rtl,),
          ),
        ],
      ),
    );
  }
}
