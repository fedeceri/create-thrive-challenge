import 'package:challenge/features/domain/entities/category/category_entity.dart';
import 'package:challenge/features/domain/repository/firebase_repository.dart';

class CreateCategoryUseCase {
  final FirebaseRepository repository;

  CreateCategoryUseCase({required this.repository});

  Future<void> call(CategoryEntity category){
    return repository.createCategory(category);
  }

}