import 'package:flutter_ex/core/app/app_response.dart';
import 'package:flutter_ex/core/data/remote/category/category_repository.dart';
import 'package:flutter_ex/core/data/remote/category/category_service.dart';
import 'package:flutter_ex/core/data/remote/category/response/category_response.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryService _categoryService;

  CategoryRepositoryImpl(this._categoryService);

  @override
  Future<AppResponse<List<CategoryResponse>>> listCategory() async =>
      await _categoryService.listCategory();

}