import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praxis_developer_test/config/routes/routes.dart';
import 'package:praxis_developer_test/config/theme/app_themes.dart';
import 'package:praxis_developer_test/features/list_items/presentation/bloc/remote/remote_employee_bloc.dart';
import 'package:praxis_developer_test/features/list_items/presentation/bloc/remote/remote_employee_event.dart';
import 'package:praxis_developer_test/features/list_items/presentation/pages/home/first_screen.dart';
import 'package:praxis_developer_test/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteEmployeeBloc>(
      create: (context) => sl()..add(const GetEmployeesEvent()),
      child: MaterialApp(
        theme: theme(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        home: const FirstScreenView(),
      ),
    );
  }
}
