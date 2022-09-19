import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final String? name;
  final String? color;

  CategoryEntity({
    this.name,
    this.color,
  });

  @override
  List<Object?> get props => [
    name,
    color,
  ];
}
