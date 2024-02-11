import 'package:flutter_ex/core/app/app_response.dart';
import 'package:flutter_ex/core/domain/type/model/type.dart';

abstract class TypeUseCase {

  Future<AppResponse<List<Type>>> listType();

}