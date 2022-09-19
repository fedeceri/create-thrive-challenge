
import 'package:challenge/features/domain/entities/item/item_entity.dart';
import 'package:challenge/features/domain/repository/firebase_repository.dart';

class CreateItemUseCase {
  final FirebaseRepository repository;

  CreateItemUseCase({required this.repository});

  Future<void> call(ItemEntity item){
    return repository.createItem(item);
  }

}