part of 'shopping_item_cubit.dart';

abstract class ShoppingItemState extends Equatable {
  const ShoppingItemState();
}

class ShoppingItemInitial extends ShoppingItemState {
  @override
  List<Object> get props => [];
}

class ShoppingItemLoading extends ShoppingItemState {
  @override
  List<Object> get props => [];
}

class ShoppingItemLoaded extends ShoppingItemState {
  final List<ItemEntity> items;

  ShoppingItemLoaded({required this.items});

  @override
  List<Object> get props => [items];
}

class ShoppingItemFailure extends ShoppingItemState {
  @override
  List<Object> get props => [];
}
