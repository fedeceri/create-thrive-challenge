
import 'package:challenge/features/domain/entities/item/item_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ShoppingItemModel extends ItemEntity {
  final String? name;
  final String? imageUrl;
  final String? category;

  ShoppingItemModel({
    this.name,
    this.imageUrl,
    this.category,
  }) : super (
    name: name,
    imageUrl: imageUrl,
    category: category
  );

  factory ShoppingItemModel.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return ShoppingItemModel(
      name: snapshot['name'],
      imageUrl: snapshot['imageUrl'],
      category: snapshot['category'],
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "imageUrl": imageUrl,
    "category": category,
  };

}