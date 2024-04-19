import "package:dio/dio.dart";
import "package:praxis_developer_test/core/constants/constants.dart";
import "package:praxis_developer_test/features/list_items/data/models/employee.dart";
import "package:retrofit/retrofit.dart";

part "employee_api_service.g.dart";

@RestApi(baseUrl: employeesAPIBaseURL)
abstract class EmployeesApiService {
  factory EmployeesApiService(Dio dio) = _EmployeesApiService;

  @GET(employeesNameAPI)
  Future<HttpResponse<List<EmployeeModel>>> getEmployees();
}
