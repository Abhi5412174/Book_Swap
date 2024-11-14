import 'package:book_swap/models/books.dart';
import 'package:flutter/material.dart';


class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({super.key, required this.item});
  // : assert(item != null),
  //   super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(item.image),
        title: Text(
          item.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text("This is description. \Rs.${item.price}"),
        trailing: Text(
          "\¢${item.credit}",
          style:const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 19,
              color:  Color.fromARGB(255, 2, 142, 7)),
        ),
      ),
    );
  }
}
