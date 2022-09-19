
import 'package:challenge/features/domain/entities/item/item_entity.dart';

import '../../../domain/entities/category/category_entity.dart';


abstract class FirebaseRemoteDataSource {
  //Item
  Future<void> createItem(ItemEntity item);

  Future<void> addToFavorites();

  Stream<List<ItemEntity>> getItems();

  //Category
  Future<void> createCategory(CategoryEntity category);

  Stream<List<CategoryEntity>> getCategories();

}