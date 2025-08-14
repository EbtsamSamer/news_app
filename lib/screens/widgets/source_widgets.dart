import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/screens/widgets/news_widget.dart';

import '../../core/api_manger.dart';
import '../../repository/news_repo.dart';

class SourceWidgets extends StatefulWidget {
  SourceWidgets({super.key,required this.repo,
    //required this.callBack   مش محتجاها
  });
  NewsRepo repo ;

  @override
  State<SourceWidgets> createState() => _SourceWidgetsState();
}

class _SourceWidgetsState extends State<SourceWidgets> {
  //Function callBack;
  //String? sourceId;  not needed
  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.repo.getSources(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text("Something went wrong",style: TextStyle(
              fontWeight: FontWeight.bold
          ),));
        }
        if (snapshot.data?.sources?.isEmpty ?? true) {
          return Center(child: Text("No Data"));
        }
       // sourceId=snapshot.data?.sources?.first.id;
        return Column(
          children: [
            DefaultTabController(
          initialIndex: currentIndex,
              length: snapshot.data?.sources?.length ?? 0,
              child: TabBar(
                onTap: (value) {
                  currentIndex=value;
                 // sourceId=snapshot.data?.sources?[value].id;
                  setState(() {

                  });
                 // callBack(snapshot.data?.sources?[value].id??" ");
                },
                isScrollable: true,
                dividerColor: Colors.transparent,
                tabAlignment: TabAlignment.start,
                unselectedLabelColor: Colors.black38,
                indicatorColor: Colors.black,
                labelStyle: GoogleFonts.inter(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),
                tabs:
                snapshot.data?.sources
                    ?.map((e) => Tab(text: e.name))
                    .toList() ??
                    [],
              ),
            ),
            NewsWidget(sourceId:snapshot.data?.sources?[currentIndex].id??" "),
          ],
        );
      },
    );
  }
}
