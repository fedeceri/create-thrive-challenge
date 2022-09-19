
import 'package:challenge/features/domain/entities/category/category_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ShoppingCategoryModel extends CategoryEntity {
  final String? name;
  final String? color;

  ShoppingCategoryModel({
    this.name,
    this.color,
  }) : super (
      name: name,
      color: color
  );

  factory ShoppingCategoryModel.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return ShoppingCategoryModel(
      name: snapshot['name'],
      color: snapshot['color'],
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "color": color,
  };

}