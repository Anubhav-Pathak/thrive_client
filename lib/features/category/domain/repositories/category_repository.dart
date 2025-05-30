import 'package:dartz/dartz.dart';

import '../entities/category_entity.dart';

abstract class ICategoryRepository {
  Future<Either<String, List<CategoryEntity>>> getCategories();
}
