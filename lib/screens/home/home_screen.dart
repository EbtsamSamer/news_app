import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/screens/pages/home_page.dart';
class HomeScreen extends StatelessWidget {
  static const String routeName = "HomeScreen";


  HomeScreen({super.key});

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
          "Home",
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
      drawer: Drawer(),
      body:HomePage(),
    );
  }
}
