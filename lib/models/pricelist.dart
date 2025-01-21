class Pricelist {
  final int? id;
  final String? image;
  final String? name;
  final int? price;
  final String? type;
  final String? category;

  Pricelist(
      {this.category, this.id, this.image, this.name, this.price, this.type});

  factory Pricelist.fromJson(Map<String, dynamic> json) {
    return Pricelist(
      id: json["id"],
      image: json["image"],
      name: json["name"],
      price: json["price"],
      category: json["category"],
      type: json["type"],
    );
  }
  
}
