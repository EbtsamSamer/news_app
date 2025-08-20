import 'package:flutter/material.dart';

import '../../core/api_manger.dart';
import '../../repository/news_repo.dart';
import '../widgets/card_item.dart';
import '../widgets/source_widgets.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key,required this.catId});
  NewsRepo newsRepo = NewsRepo(ApiManger());
  String catId;
  @override
  Widget build(BuildContext context) {
    return  SourceWidgets(repo: newsRepo,catId:catId ,);
  }
}
