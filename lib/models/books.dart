class Books {
  static  List<Item> items = [
    Item(
        id: 001,
        name: "demo_book1",
        desc: "this is a book1.",
        price: 500,
        credit: 5,
        image:
            "https://exponentwptheme.com/book/wp-content/uploads/sites/26/2019/02/book-mockup-exponent-min.png")
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final num credit;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.credit,
      required this.image});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      credit: map["credit"],
      image: map["image"],
    );
  }

  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "credit": credit,
        "image": image,
      };
}
