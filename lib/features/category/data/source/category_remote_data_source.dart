import '../models/category.dart';

abstract class CategoryRemoteDataSource {
  Future<List<Category>> fetchCategories();
}

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  @override
  Future<List<Category>> fetchCategories() async {
    // TODO: Implement API call to fetch categories
    // Example:
    // final response = await http.get(Uri.parse('https://api.example.com/categories'));
    // final data = jsonDecode(response.body) as List;
    // return data.map((json) => CategoryModel.fromJson(json)).toList();
    throw UnimplementedError();
  }
}
