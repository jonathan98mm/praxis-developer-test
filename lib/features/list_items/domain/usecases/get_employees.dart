import 'package:praxis_developer_test/core/resources/data_state.dart';
import 'package:praxis_developer_test/core/usecase/usecase.dart';
import 'package:praxis_developer_test/features/list_items/domain/entities/employee.dart';
import 'package:praxis_developer_test/features/list_items/domain/repository/employee_repository.dart';

class GetEmployeesUseCase implements UseCase<DataState<List<EmployeeEntity>>, void> {
  final EmployeeRepository _employeeRepository;

  GetEmployeesUseCase(this._employeeRepository);

  @override
  Future<DataState<List<EmployeeEntity>>> call({void params}) {
    return _employeeRepository.getEmployees();
  }
}
