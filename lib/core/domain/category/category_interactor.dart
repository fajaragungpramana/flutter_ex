import 'package:flutter_ex/core/app/app_response.dart';
import 'package:flutter_ex/core/data/remote/category/category_repository.dart';
import 'package:flutter_ex/core/domain/category/category_use_case.dart';
import 'package:flutter_ex/core/domain/category/model/category.dart';

class CategoryInteractor implements CategoryUseCase {
  final CategoryRepository _categoryRepository;

  CategoryInteractor(this._categoryRepository);

  @override
  Future<AppResponse<List<Category>>> listCategory() async {
    final response = await _categoryRepository.listCategory();
    return response.when(
        success: (data) {
          return AppResponse.success(data: Category.mapToList(data));
        },
        failure: (message) {
          return AppResponse.failure(message: message);
        },
        error: (e) {
          return AppResponse.error(exception: e);
        }
    );
  }

}