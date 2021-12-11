class Menu {
  final String key;
  final String description;
  final String orderTag;

  Menu({required this.key, required this.description, required this.orderTag});

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(
      key: json['key'],
      description: json['description'],
      orderTag: json['orderTag'],
    );
  }
}

class Item {
  String name;
  String image;
  String caption;

  Item({required this.name, required this.image, required this.caption});

  factory Item.fromJson(Map<dynamic, dynamic> json) {
    return Item(
      name: json['name'], 
      caption: json['caption'], 
      image: json['image'],
    );
  }  
}
