import 'dart:convert';
import 'package:book_swap/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchSection extends StatefulWidget {
  const SearchSection({super.key});

  @override
  State<SearchSection> createState() => _SearchSectionState();
}


class _SearchSectionState extends State<SearchSection> {
  List<dynamic> _allBooks = [];
  List<dynamic> _filteredBooks = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadData();
    _searchController.addListener(_updateSearch);
  }

  @override
  void dispose() {
    _searchController.removeListener(_updateSearch);
    _searchController.dispose();
    super.dispose();
  }

  // Load book data from JSON file
  Future<void> loadData() async {
    final String bookJson =
        await rootBundle.loadString("assets/files/books.json");
    final Map<String, dynamic> decodedData = jsonDecode(bookJson);
    final List<dynamic> productsData = decodedData["products"];

    setState(() {
      _allBooks = productsData;
      _filteredBooks = _allBooks; // Initially show all books
    });
  }

  // Update search results based on search query
  void _updateSearch() {
    setState(() {
      String query = _searchController.text.toLowerCase();
      _filteredBooks = _allBooks
          .where((book) => book["name"].toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushNamed(context, MyRoutes.homeRoute);
          },
        ),
        title: const Text("Search", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search for a book",
                prefixIcon: const Icon(Icons.search, color: Colors.deepPurple),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: Colors.deepPurple),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _filteredBooks.isNotEmpty
                  ? ListView.builder(
                      itemCount: _filteredBooks.length,
                      itemBuilder: (context, index) {
                        final book = _filteredBooks[index];
                        return ListTile(
                          leading: Image.network(book["image"],
                              width: 50, height: 50, fit: BoxFit.cover),
                          title: Text(book["name"]),
                          subtitle: Text("Price: \$${book["price"]}"),
                        );
                      },
                    )
                  : const Center(
                      child: Text(
                        "No books found",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}


