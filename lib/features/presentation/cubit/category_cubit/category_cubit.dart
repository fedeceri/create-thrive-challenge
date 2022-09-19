import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:challenge/features/domain/entities/category/category_entity.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/use_cases/firebase_usecases/category/create_category_usecase.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CreateCategoryUseCase createCategoryUseCase;

  CategoryCubit({required this.createCategoryUseCase}) : super(CategoryInitial());

  Future<void> createCategory({required CategoryEntity category}) async {
    emit(CategoryLoading());
    try {
      await createCategoryUseCase.call(category);
    } on SocketException catch (e) {
      emit(CategoryFailure());
      print(e);
    } catch (e) {
      emit(CategoryFailure());
    }
  }
}
