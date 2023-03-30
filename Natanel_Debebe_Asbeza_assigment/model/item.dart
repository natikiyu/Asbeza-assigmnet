class  Item {
  String name;
  num price;
  String image;
  String? discription;


  Item({
    required this.name,
    required this.price,
    required this.image,
    this.discription,
  });

  factory Item.fromJson(Map<String, dynamic> parsedJson) {
    return Item(
      name: parsedJson['title'],
      price: parsedJson['price'],
      image: parsedJson['image'],
      discription: parsedJson['description']
    );
  }
  toJson() {
    Map<String, dynamic> json = {};
    json['name'] = name;
    json['price'] = price;
    json['image'] = image;
    json['discription'] = discription;
    return json;
  }

  static List itemList(List item) {
    List items = [];
    for (var i = 0; i < item.length; i++) {
      items.add(Item.fromJson(item[i]));
    }
    return items;
  }
}
class Cart{

}
