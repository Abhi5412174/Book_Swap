import 'package:book_swap/models/books.dart';
import 'package:book_swap/widgets/home_widgets/book_image.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class BookItem extends StatelessWidget {
  final Item book;

  BookItem({Key? key, required this.book}) : super(key: key); // Removed `const`

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          BookImage(image: book.image),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                book.name.text.xl.bold.make(),
                book.desc.text.textStyle(context.captionStyle).bold.make(),
                "Rs. ${book.price}".text.bold.make(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OverflowBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    children: [
                      "Credits: €${book.credit}"
                          .text
                          .bold
                          .xl
                          .textStyle(const TextStyle(
                              color: Color.fromARGB(
                                  255, 46, 134, 49))) // Apply TextStyle here
                          .make(),
                      ElevatedButton(
                        onPressed: () {},
                        child: "Swap".text.make(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ).white.rounded.square(150).make().py12();
  }
}

