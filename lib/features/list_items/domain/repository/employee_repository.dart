import 'package:praxis_developer_test/core/resources/data_state.dart';
import 'package:praxis_developer_test/features/list_items/domain/entities/employee.dart';

abstract class EmployeeRepository {
  //API methods
  Future<DataState<List<EmployeeEntity>>> getEmployees();
}
