import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/NewsResponse.dart';

class CardItem extends StatelessWidget {
  Articles? article;

  CardItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white, width: 1),
      ),
      child: Column(
        spacing: 10,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16) ,
            child: Image.network(
              article?.urlToImage ?? " ",
              fit: BoxFit.cover,
              width:345,
              height: 220,
            ),
          ),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
           child: Column(
             spacing:8,
               children: [
             Text(article?.title ?? " ",style: GoogleFonts.poppins(
               fontWeight: FontWeight.bold,
               fontSize: 16,
               color: Colors.black
             ),),
             Text(article?.description ?? " "),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text(article?.author?? " ",style: GoogleFonts.poppins(
                   fontSize: 12,
                   fontWeight: FontWeight.w500,
                   color: Color(0xFFA0A0A0),
                 ),
                   maxLines: 1,
                   overflow:TextOverflow.ellipsis ,
                 ),
                 Text(article?.publishedAt?.substring(0, 10) ?? " ",style: GoogleFonts.poppins(
                     fontSize: 12,
                     fontWeight: FontWeight.w500,
                     color: Color(0xFFA0A0A0)
                 )),
               ],
             ),
           ],),
         )
        ],
      ),
    );
  }
}
