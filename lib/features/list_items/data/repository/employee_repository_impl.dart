import 'dart:io';

import 'package:dio/dio.dart';
import 'package:praxis_developer_test/core/resources/data_state.dart';
import 'package:praxis_developer_test/features/list_items/data/data_sources/remote/employee_api_service.dart';
import 'package:praxis_developer_test/features/list_items/domain/entities/employee.dart';
import 'package:praxis_developer_test/features/list_items/domain/repository/employee_repository.dart';
import 'package:retrofit/retrofit.dart';

class EmployeeRepositoryImpl implements EmployeeRepository {
  final EmployeesApiService _employeesApiService;

  EmployeeRepositoryImpl(this._employeesApiService);

  @override
  Future<DataState<List<EmployeeEntity>>> getEmployees() async {
    try {
      final HttpResponse httpResponse = await _employeesApiService.getEmployees();

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
