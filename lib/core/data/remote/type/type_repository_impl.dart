import 'package:flutter_ex/core/app/app_response.dart';
import 'package:flutter_ex/core/data/remote/type/response/type_response.dart';
import 'package:flutter_ex/core/data/remote/type/type_repository.dart';
import 'package:flutter_ex/core/data/remote/type/type_service.dart';

class TypeRepositoryImpl implements TypeRepository {
  final TypeService _typeService;

  TypeRepositoryImpl(this._typeService);

  @override
  Future<AppResponse<List<TypeResponse>>> listType() async => await _typeService.listType();

}