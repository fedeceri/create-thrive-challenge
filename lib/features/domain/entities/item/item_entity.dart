import 'package:equatable/equatable.dart';

class ItemEntity extends Equatable {
  final String? name;
  final String? imageUrl;
  final String? category;

  ItemEntity({
    this.name,
    this.imageUrl,
    this.category,
  });

  @override
  List<Object?> get props => [
        name,
        imageUrl,
        category,
      ];
}
