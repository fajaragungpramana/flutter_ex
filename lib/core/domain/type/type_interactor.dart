import 'package:flutter_ex/core/app/app_response.dart';
import 'package:flutter_ex/core/data/remote/type/type_repository.dart';
import 'package:flutter_ex/core/domain/type/type_use_case.dart';
import 'package:flutter_ex/core/domain/type/model/type.dart';

class TypeInteractor implements TypeUseCase {
  final TypeRepository _typeRepository;

  const TypeInteractor(this._typeRepository);

  @override
  Future<AppResponse<List<Type>>> listType() async {
    final response = await _typeRepository.listType();
    return response.when(
        success: (data) {
          return AppResponse.success(data: Type.mapToList(data));
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