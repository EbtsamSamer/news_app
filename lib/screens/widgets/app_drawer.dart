import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppDrawer extends StatefulWidget {
  AppDrawer({super.key, required this.onClick});

  Function onClick;

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  String selectedLanguage = "English";

  String selectedTheme = "Dark";

  List<String> languages = ['English', 'Arabic'];

  List<String> themes = ['Dark', 'Light'];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: MediaQuery.of(context).size.width * 0.6,
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            height: 200,
            alignment: Alignment.center,
            child: Text(
              "News App",
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: GestureDetector(
              onTap: () {
               widget.onClick();
              },
              child: Row(
                spacing: 10,
                children: [
                  Icon(Icons.home_filled, color: Colors.white),
                  Text(
                    "Go To Home",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(color: Colors.white, indent: 16, endIndent: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              spacing: 10,
              children: [
                Icon(Icons.imagesearch_roller_outlined, color: Colors.white),
                Text(
                  "Theme",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white, width: 1),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isExpanded: true,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
                padding: EdgeInsets.only(left: 8),
                dropdownColor: Colors.blueGrey,
                iconEnabledColor: Colors.white,
                iconDisabledColor: Colors.white,
                iconSize: 35,
                borderRadius: BorderRadius.circular(25),
                value: selectedLanguage,
                items: languages.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    selectedLanguage = newValue;
                    setState(() {});
                  }
                },
              ),
            ),
          ),
          Divider(color: Colors.white, indent: 16, endIndent: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              spacing: 10,
              children: [
                Icon(Icons.wordpress_outlined, color: Colors.white),
                Text(
                  "Language",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white, width: 1),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isExpanded: true,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
                padding: EdgeInsets.only(left: 8),
                dropdownColor: Colors.blueGrey,
                iconEnabledColor: Colors.white,
                iconDisabledColor: Colors.white,
                iconSize: 35,
                borderRadius: BorderRadius.circular(25),
                value: selectedTheme,
                items: themes.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    selectedTheme = newValue;
                    setState(() {});
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
