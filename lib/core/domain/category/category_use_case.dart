import 'package:flutter_ex/core/app/app_response.dart';
import 'package:flutter_ex/core/domain/category/model/category.dart';

abstract class CategoryUseCase {

  Future<AppResponse<List<Category>>> listCategory();

}