class Product {
  String? id;
  String? price;
  String? name;
  String? details;
  String? img;

  Product({this.id, this.price, this.name,this.img});

  Product.fromMap(Map snapshot,String id) :
        id = id ?? '',
        price = snapshot['price'] ?? '',
        name = snapshot['name'] ?? '',
        details=snapshot['details'] ?? '',
        img = snapshot['img'] ?? '';

  toJson() {
    return {
      "price": price,
      "name": name,
      "details":details,
      "img": img,
    };
  }
}