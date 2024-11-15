import 'package:book_swap/pages/add_books.dart';
import 'package:book_swap/pages/home_page.dart';
import 'package:book_swap/pages/login_page.dart';
import 'package:book_swap/pages/profile_section.dart';
import 'package:book_swap/pages/search_section.dart';
import 'package:book_swap/pages/signup_page.dart';
import 'package:book_swap/pages/welcome_page.dart';
import 'package:book_swap/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.notoSansTifinagh().fontFamily,
        textTheme: GoogleFonts.narnoorTextTheme(),
        appBarTheme: const AppBarTheme(
          color: Colors.deepPurple,
        ),
      ),
      initialRoute: MyRoutes.homeRoute, // initil route set garne
      routes: {
        MyRoutes.welcomeRoute: (context) =>
            WelcomePage(), // Add WelcomePage route
        MyRoutes.signupRoute: (context) => SignupPage(),
        MyRoutes.homeRoute: (context) => const MyHomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.addBooksRoute: (context) => const AddBooksSection(),
        MyRoutes.profileRoute: (context) => const ProfileSection(),
        MyRoutes.searchRoute: (context) => const SearchSection(),
      },
    );
  }
}
