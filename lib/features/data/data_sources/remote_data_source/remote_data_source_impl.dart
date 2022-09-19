import 'package:challenge/const.dart';
import 'package:challenge/features/data/data_sources/remote_data_source/remote_data_source.dart';
import 'package:challenge/features/data/models/shopping_category/shopping_category.dart';
import 'package:challenge/features/data/models/shopping_item/shopping_item_model.dart';
import 'package:challenge/features/domain/entities/category/category_entity.dart';
import 'package:challenge/features/domain/entities/item/item_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseRemoteDataSourceImpl implements FirebaseRemoteDataSource {
  final FirebaseFirestore firebaseFirestore;

  FirebaseRemoteDataSourceImpl({required this.firebaseFirestore});

  @override
  Future<void> createItem(ItemEntity item) async {
    final itemCollection = firebaseFirestore.collection(FirebaseConst.items);

    itemCollection.doc(item.name).get().then((itemDoc) {
      final newItem = ShoppingItemModel(
        name: item.name,
        imageUrl: item.imageUrl,
        category: item.category,
      ).toJson();

      if (!itemDoc.exists) {
        itemCollection.doc(item.name).set(newItem);
        toast("Item created");
      } else {
        itemCollection.doc(item.name).update(newItem);
        toast("Item already created, try with another name");
      }
    }).catchError((error) {
      toast("An error occurred");
    });
  }

  @override
  Future<void> addToFavorites() {
    // TODO: implement addToFavorites
    throw UnimplementedError();
  }

  @override
  Future<void> createCategory(CategoryEntity category) async {
    final itemCollection = firebaseFirestore.collection(FirebaseConst.categories);

    itemCollection.doc(category.name).get().then((itemDoc) {
      final newItem = ShoppingCategoryModel(
        name: category.name,
        color: category.color,
      ).toJson();

      if (!itemDoc.exists) {
        itemCollection.doc(category.name).set(newItem);
        toast("Category created");
      } else {
        itemCollection.doc(category.name).update(newItem);
        toast("Category already created, try with another name");
      }
    }).catchError((error) {
      toast("An error occurred");
    });
  }

  @override
  Stream<List<CategoryEntity>> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }

  @override
  Stream<List<ItemEntity>> getItems() {
    final itemCollection = firebaseFirestore.collection(FirebaseConst.items);
    return itemCollection.snapshots().map((querySnapshot) => querySnapshot.docs.map((e) => ShoppingItemModel.fromSnapshot(e)).toList());
  }
}
