import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/screens/pages/category_page.dart';
import 'package:news_app/screens/pages/home_page.dart';
import 'package:news_app/screens/widgets/app_drawer.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, size: 30, color: Colors.black),
          ),
        ],
        centerTitle: true,
        title: Text(
          categoryModel?.name??"",
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
      drawer: AppDrawer(onClick: onDrawerClick),
      body: categoryModel == null
          ? CategoriesPage(onClick: onClick)
          : HomePage(catId: categoryModel?.id ?? " "),
    );
  }

  CategoryModel? categoryModel = null;
  onDrawerClick(){
    categoryModel=null;
    Navigator.pop(context);
    setState(() {

    });
  }
  onClick(category) {
    categoryModel = category;
    setState(() {

    });
  }
}
