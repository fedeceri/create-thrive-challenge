
import 'package:challenge/features/data/data_sources/remote_data_source/remote_data_source.dart';
import 'package:challenge/features/domain/entities/category/category_entity.dart';

import 'package:challenge/features/domain/entities/item/item_entity.dart';

import '../../domain/repository/firebase_repository.dart';

class FirebaseRepositoryImpl implements FirebaseRepository {
  final FirebaseRemoteDataSource remoteDataSource;

  FirebaseRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> addToFavorites() {
    // TODO: implement addToFavorites
    throw UnimplementedError();
  }

  @override
  Future<void> createCategory(CategoryEntity category) async => remoteDataSource.createCategory(category);

  @override
  Future<void> createItem(ItemEntity item) async => remoteDataSource.createItem(item);

  @override
  Stream<List<CategoryEntity>> getCategories() => remoteDataSource.getCategories();

  @override
  Stream<List<ItemEntity>> getItems() {
    // TODO: implement getItems
    throw UnimplementedError();
  }

}