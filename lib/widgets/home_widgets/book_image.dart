import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class BookImage extends StatelessWidget {
  final String image;

  BookImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
    ).box.p16.color(Colors.white10).make().p12().w32(context);
  }
}