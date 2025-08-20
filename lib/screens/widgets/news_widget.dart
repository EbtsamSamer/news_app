import 'package:flutter/material.dart';

import '../../core/api_manger.dart';
import '../../repository/news_repo.dart';
import 'card_item.dart';

class NewsWidget extends StatelessWidget {
   NewsWidget({super.key,required this.sourceId});
  NewsRepo newsRepo = NewsRepo(ApiManger());
   String sourceId;
  @override
  Widget build(BuildContext context) {
    return   FutureBuilder(
      future: newsRepo.getnews(sourceId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(
            child: Text(
              "Something went wrong",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          );
        }
        if (snapshot.data?.articles?.isEmpty ?? true) {
          return Center(child: Text("No Data"));
        }
        return Expanded(

          child: ListView.builder(itemBuilder: (context, index) {
            return CardItem(article: snapshot.data?.articles?[index],);
          },
            itemCount: snapshot.data?.totalResults??0,
          ),
        );
      },
    );
  }
}
