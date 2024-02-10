import 'package:flutter_ex/core/app/app_response.dart';
import 'package:flutter_ex/core/data/remote/category/response/category_response.dart';

abstract class CategoryUseCase {

  Future<AppResponse<List<CategoryResponse>>> listCategory();

}