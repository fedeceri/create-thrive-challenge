import 'package:challenge/features/data/data_sources/remote_data_source/remote_data_source.dart';
import 'package:challenge/features/data/data_sources/remote_data_source/remote_data_source_impl.dart';
import 'package:challenge/features/domain/repository/firebase_repository.dart';
import 'package:challenge/features/domain/use_cases/firebase_usecases/category/create_category_usecase.dart';
import 'package:challenge/features/domain/use_cases/firebase_usecases/item/create_item_usecase.dart';
import 'package:challenge/features/presentation/cubit/shopping_item/shopping_item_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

import 'features/data/repository/firebase_repository_impl.dart';
import 'features/presentation/cubit/category_cubit/category_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Cubits
  sl.registerFactory(
    () => ShoppingItemCubit(
      createItemUseCase: sl.call(),
    ),
  );
  sl.registerFactory(
    () => CategoryCubit(
      createCategoryUseCase: sl.call(),
    ),
  );

  //Use cases
  sl.registerLazySingleton(
    () => CreateItemUseCase(
      repository: sl.call(),
    ),
  );
  sl.registerLazySingleton(
    () => CreateCategoryUseCase(
      repository: sl.call(),
    ),
  );

  //Repositories
  sl.registerLazySingleton<FirebaseRepository>(
    () => FirebaseRepositoryImpl(
      remoteDataSource: sl.call(),
    ),
  );

  //Remote Data Source
  sl.registerLazySingleton<FirebaseRemoteDataSource>(
    () => FirebaseRemoteDataSourceImpl(
      firebaseFirestore: sl.call(),
    ),
  );

  //Externals
  final firebaseFirestore = FirebaseFirestore.instance;

  sl.registerLazySingleton(() => firebaseFirestore);
}
