import 'package:book_swap/models/books.dart';
import 'package:book_swap/widgets/home_widgets/book_item.dart';
import 'package:flutter/material.dart';

class BookList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: Books.items.length,
      itemBuilder: (context, index) {
        final book = Books.items[index];
        return BookItem(book: book);
      },
    );
  }
}