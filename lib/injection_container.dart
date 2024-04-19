import "package:dio/dio.dart";
import "package:get_it/get_it.dart";
import "package:praxis_developer_test/features/list_items/data/data_sources/remote/employee_api_service.dart";
import "package:praxis_developer_test/features/list_items/data/repository/employee_repository_impl.dart";
import "package:praxis_developer_test/features/list_items/domain/repository/employee_repository.dart";
import "package:praxis_developer_test/features/list_items/domain/usecases/get_employees.dart";
import "package:praxis_developer_test/features/list_items/presentation/bloc/remote/remote_employee_bloc.dart";

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //Dio
  sl.registerSingleton<Dio>(Dio());

  //Dependencies
  sl.registerSingleton<EmployeesApiService>(EmployeesApiService(sl()));
  sl.registerSingleton<EmployeeRepository>(EmployeeRepositoryImpl(sl()));

  //UseCases
  sl.registerSingleton<GetEmployeesUseCase>(GetEmployeesUseCase(sl()));

  //Blocs
  sl.registerFactory<RemoteEmployeeBloc>(() => RemoteEmployeeBloc(sl()));
}
