// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CatalogModal {

  static final catModal = CatalogModal._internal();
  CatalogModal._internal();

  factory CatalogModal() => catModal;


  static List<Item>? items;

   Item getById(double price) =>
      items!.firstWhere((element) => element.price == price, orElse: null);

   Item getByPosition(int pos) => items![pos];
}

class Item {
  final String title;
  final String type;
  final String description;
  final String filename;
  final double price;
  final num rating;

  Item(
      {required this.title,
      required this.type,
      required this.description,
      required this.filename,
      required this.price,
      required this.rating});

  Item copyWith({
    required final String title,
    required final String type,
    required final String description,
    required final String filename,
    required final double price,
    required final num rating,
  }) {
    return Item(
      title: title,
      type: type,
      description: description,
      filename: filename,
      price: price,
      rating: rating,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'type': type,
      'description': description,
      'filename': filename,
      'price': price,
      'rating': rating,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
        title: map["title"],
        type: map["type"],
        description: map["description"],
        filename: map["filename"],
        price: map["price"],
        rating: map["rating"]);
  }

  /// some hand made code---------------
  // factory Item.fromMap(Map<dynamic, dynamic> map) {
  //   return Item(
  //       title: map["title"],
  //       type: map["type"],
  //       description: map["description"],
  //       filename: map["filename"],
  //       price: map["price"],
  //       rating: map["rating"]);
  // }
  //
  // toMap()=>{
  //   "title":title,
  //   "type":type,
  //   "description":description,
  //   "filename":filename,
  //   "price":price,
  //   "rating":rating,
  // };

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Item(title: $title, type: $type, description: $description, filename: $filename, price: $price, rating: $rating)';
  }

  @override
  bool operator ==(covariant Item other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.type == type &&
        other.description == description &&
        other.filename == filename &&
        other.price == price &&
        other.rating == rating;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        type.hashCode ^
        description.hashCode ^
        filename.hashCode ^
        price.hashCode ^
        rating.hashCode;
  }
}
