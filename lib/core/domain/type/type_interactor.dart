import 'package:flutter_ex/core/app/app_response.dart';
import 'package:flutter_ex/core/data/remote/type/response/type_response.dart';
import 'package:flutter_ex/core/data/remote/type/type_repository.dart';
import 'package:flutter_ex/core/domain/type/type_use_case.dart';

class TypeInteractor implements TypeUseCase {
  final TypeRepository _typeRepository;

  const TypeInteractor(this._typeRepository);

  @override
  Future<AppResponse<List<TypeResponse>>> listType() async => await _typeRepository.listType();

}