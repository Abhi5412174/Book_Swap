import 'package:book_swap/models/books.dart';
import 'package:book_swap/widgets/home_widgets/add_books.dart';
import 'package:book_swap/widgets/home_widgets/bottom_navigation_panel.dart';
import 'package:book_swap/utils/my_navigation_panel.dart';
import 'package:book_swap/widgets/home_widgets/book_list.dart';
import 'package:book_swap/widgets/drawer.dart';
import 'package:book_swap/pages/profile_section.dart';
import 'package:book_swap/pages/search_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeSection(),
    const BooksSection(),
    const AddBooksSection(),
    const SearchSection(),
    const ProfileSection(),
  ];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      final bookJson = await rootBundle.loadString("assets/files/books.json");
      final decodedData = jsonDecode(bookJson);
      var productsData = decodedData["products"];
      Books.items = List.from(productsData)
          .map<Item>((item) => Item.fromMap(item))
          .cast<Item>()
          .toList();
    } catch (e) {
      print("ya error aauna sakcha");
    }
    setState(() {});
  }

  void _onNavBarTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(child: _pages[_currentIndex]),
      bottomNavigationBar: MyNavigationPanel(
        currentIndex: _currentIndex,
        onNavBarTapped: _onNavBarTapped,
      ),
      drawer: MyDrawer(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Book Swap",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            "Find your next read",
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Vx.mOnly(left: 32, right: 32, top: 20),
      child: Books.items.isNotEmpty
          ? BookList().expand()
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
