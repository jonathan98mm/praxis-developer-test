import 'package:praxis_developer_test/features/list_items/domain/entities/employee.dart';

class EmployeeModel extends EmployeeEntity {
  const EmployeeModel({
    super.id,
    super.name,
    super.lastName,
    super.birthday,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      lastName: json["last_name"] ?? "",
      birthday: json["birthday"] ?? 0,
    );
  }

  factory EmployeeModel.fromEntity(EmployeeEntity entity) {
    return EmployeeModel(
      id: entity.id,
      name: entity.name,
      lastName: entity.lastName,
      birthday: entity.birthday,
    );
  }
}
