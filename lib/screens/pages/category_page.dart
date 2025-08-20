import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/category_model.dart';

class CategoriesPage extends StatelessWidget {
  CategoriesPage({super.key,required this.onClick});

  List<CategoryModel>categories = CategoryModel.getCategory();
    Function onClick;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 16,),
                itemBuilder:(context, index) {
                  return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      child: Stack(
                          alignment:index.isEven? Alignment.bottomRight:Alignment.bottomLeft,
                          children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: Image.asset(categories[index].image??" ")),
                        GestureDetector(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              color: Colors.white.withOpacity(.5)
                            ),
                            child: Row(
                              spacing: 12,
                                                 mainAxisSize: MainAxisSize.min,
                              children: [
                                if(index.isOdd) CircleAvatar(
                                  radius: 30,
                                  child: Icon(Icons.arrow_back_ios),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("View All",style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 24
                                  ),),
                                ),
                               if(index.isEven) CircleAvatar(
                                 radius: 30,
                                 child: Icon(Icons.arrow_forward_ios_outlined),
                               ),

                              ],
                            ),

                          ),
                          onTap: () {
                            onClick(categories[index]);
                          },
                        )
                      ]
                      ));
                },

                itemCount:categories.length
            ),
          ),
        ),
      ],
    );
  }
}
