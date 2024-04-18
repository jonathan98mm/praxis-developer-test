import 'package:equatable/equatable.dart';

class EmployeeEntity extends Equatable {
  final int? id;
  final String? name;
  final String? lastName;
  final int? birthday;

  const EmployeeEntity({
    this.id,
    this.name,
    this.lastName,
    this.birthday,
  });

  @override
  List<Object?> get props {
    return [
      id,
      name,
      lastName,
      birthday,
    ];
  }
}
