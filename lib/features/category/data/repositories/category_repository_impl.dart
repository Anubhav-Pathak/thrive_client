import 'package:dartz/dartz.dart';
import 'package:thrive_client/features/category/data/source/category_remote_data_source.dart';
import 'package:thrive_client/features/category/domain/entities/category_entity.dart';
import 'package:thrive_client/features/category/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements ICategoryRepository {
  final CategoryRemoteDataSource remoteDataSource;

  CategoryRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<String, List<CategoryEntity>>> getCategories() async {
    try {
      final categories = await remoteDataSource.fetchCategories();
      return Right(categories);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
