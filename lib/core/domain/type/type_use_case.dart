import 'package:flutter_ex/core/app/app_response.dart';
import 'package:flutter_ex/core/data/remote/type/response/type_response.dart';

abstract class TypeUseCase {
  Future<AppResponse<List<TypeResponse>>> listType();
}