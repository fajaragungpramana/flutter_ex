import 'package:flutter_ex/core/app/app_response.dart';
import 'package:flutter_ex/core/data/remote/category/category_repository.dart';
import 'package:flutter_ex/core/data/remote/category/response/category_response.dart';
import 'package:flutter_ex/core/domain/category/category_use_case.dart';

class CategoryInteractor implements CategoryUseCase {
  final CategoryRepository _categoryRepository;

  CategoryInteractor(this._categoryRepository);

  @override
  Future<AppResponse<List<CategoryResponse>>> listCategory() async =>
      await _categoryRepository.listCategory();

}