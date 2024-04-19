import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:praxis_developer_test/features/list_items/domain/entities/employee.dart';

abstract class RemoteEmployeesState extends Equatable {
  final List<EmployeeEntity>? employees;
  final DioException? error;

  const RemoteEmployeesState({this.employees, this.error});

  @override
  List<Object> get props => [employees!, error!];
}

class RemoteEmployeesLoading extends RemoteEmployeesState {
  const RemoteEmployeesLoading();
}

class RemoteEmployeesDone extends RemoteEmployeesState {
  const RemoteEmployeesDone(List<EmployeeEntity> employees) : super(employees: employees);
}

class RemoteEmployeesError extends RemoteEmployeesState {
  const RemoteEmployeesError(DioException error) : super(error: error);
}
