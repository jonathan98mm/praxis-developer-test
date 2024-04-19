import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praxis_developer_test/core/resources/data_state.dart';
import 'package:praxis_developer_test/features/list_items/domain/usecases/get_employees.dart';
import 'package:praxis_developer_test/features/list_items/presentation/bloc/remote/remote_employee_event.dart';
import 'package:praxis_developer_test/features/list_items/presentation/bloc/remote/remote_employee_state.dart';

class RemoteEmployeeBloc extends Bloc<RemoteEmployeesEvent, RemoteEmployeesState> {
  final GetEmployeesUseCase _getEmployeesUseCase;

  RemoteEmployeeBloc(this._getEmployeesUseCase) : super(const RemoteEmployeesLoading()) {
    on<GetEmployeesEvent>(onGetEmployees);
  }

  void onGetEmployees(GetEmployeesEvent event, Emitter<RemoteEmployeesState> emit) async {
    final dataState = await _getEmployeesUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteEmployeesDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(RemoteEmployeesError(dataState.error!));
    }
  }
}
