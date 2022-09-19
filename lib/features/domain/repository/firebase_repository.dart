
import 'package:challenge/features/domain/entities/item/item_entity.dart';

import '../entities/category/category_entity.dart';

abstract class FirebaseRepository {
  //Item
  Future<void> createItem(ItemEntity item);
  Future<void> addToFavorites();
  Stream<List<ItemEntity>> getItems();

  //Category
  Future<void> createCategory(CategoryEntity category);
  Stream<List<CategoryEntity>> getCategories();


}