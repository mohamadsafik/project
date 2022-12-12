class ProductModel {
  String? name;
  String? price;
  String? image;
  String? id;

  ProductModel({this.name, this.price, this.image, this.id});

  ProductModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    image = json['image'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    data['image'] = this.image;
    data['id'] = this.id;
    return data;
  }
}
