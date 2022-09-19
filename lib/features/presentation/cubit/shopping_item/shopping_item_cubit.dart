import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/item/item_entity.dart';
import '../../../domain/use_cases/firebase_usecases/item/create_item_usecase.dart';

part 'shopping_item_state.dart';

class ShoppingItemCubit extends Cubit<ShoppingItemState> {
  final CreateItemUseCase createItemUseCase;

  //final GetItemsUseCase getItemsUseCase;

  ShoppingItemCubit({required this.createItemUseCase}) : super(ShoppingItemInitial());

  Future<void> createItem({required ItemEntity item}) async {
    emit(ShoppingItemLoading());
    try {
      await createItemUseCase.call(item);
    } on SocketException catch (e) {
      emit(ShoppingItemFailure());
      print(e);
    } catch (e) {
      emit(ShoppingItemFailure());
    }
  }
}
