import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:praxis_developer_test/features/list_items/presentation/bloc/remote/remote_employee_bloc.dart';
import 'package:praxis_developer_test/features/list_items/presentation/bloc/remote/remote_employee_state.dart';

class SecondScreenView extends StatefulWidget {
  final bool isCameraEnabled;
  final bool isEmployeesEnabled;
  final bool isNameEnabled;
  final bool isPhoneEnabled;
  final bool isBirthdateEnabled;
  final bool isGenderEnabled;
  final bool isColorEnabled;

  const SecondScreenView(
      {super.key,
      required this.isCameraEnabled,
      required this.isEmployeesEnabled,
      required this.isNameEnabled,
      required this.isPhoneEnabled,
      required this.isBirthdateEnabled,
      required this.isGenderEnabled,
      required this.isColorEnabled});

  @override
  State<SecondScreenView> createState() => _SecondScreenViewState();
}

class _SecondScreenViewState extends State<SecondScreenView> {
  DateFormat formatDate = DateFormat("dd-MM-yyyy");
  late TextEditingController birthdateController;
  late MultiSelectController selectController;
  String gender = "Masculino";

  @override
  void initState() {
    birthdateController = TextEditingController();
    selectController = MultiSelectController();
    super.initState();
  }

  @override
  void dispose() {
    birthdateController.dispose();
    selectController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: const Text(
        "Praxis Developer Test",
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
      ),
    );
  }

  _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          widget.isCameraEnabled ? _buildCamera() : Container(),
          widget.isEmployeesEnabled ? _buildEmployees() : Container(),
          widget.isNameEnabled ? _buildName() : Container(),
          widget.isPhoneEnabled ? _buildPhone() : Container(),
          widget.isBirthdateEnabled ? _buildBirthdate() : Container(),
          widget.isGenderEnabled ? _buildGender() : Container(),
          widget.isColorEnabled ? _buildColor() : Container(),
        ],
      ),
    );
  }

  Widget _buildCamera() {
    return Column(
      children: [
        const SizedBox(height: 30),
        const Text(
          "Cámara",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        GestureDetector(
          onTap: null,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * .80,
            child: const Image(image: AssetImage("assets/images/no_image.jpg")),
          ),
        ),
        const SizedBox(height: 10)
      ],
    );
  }

  Widget _buildEmployees() {
    return Column(
      children: [
        const SizedBox(height: 30),
        const Text(
          "Lista de empleados",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        BlocBuilder<RemoteEmployeeBloc, RemoteEmployeesState>(
          builder: (_, state) {
            if (state is RemoteEmployeesLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is RemoteEmployeesError) {
              return const Center(child: Icon(Icons.refresh));
            }

            if (state is RemoteEmployeesDone) {
              return ListView.builder(
                itemCount: state.employees!.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text(
                      state.employees![index].id.toString(),
                      style: const TextStyle(fontSize: 12),
                    ),
                    title: Text(state.employees![index].name!),
                    subtitle: Text(state.employees![index].lastName!),
                    trailing: Text(
                      formatDate.format(
                        DateTime.fromMillisecondsSinceEpoch(state.employees![index].birthday!, isUtc: true),
                      ),
                    ),
                  );
                },
              );
            }

            return const SizedBox();
          },
        ),
      ],
    );
  }

  Widget _buildName() {
    return const Column(
      children: [
        SizedBox(height: 30),
        Text(
          "Nombre completo",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            keyboardType: TextInputType.name,
            maxLength: 35,
            maxLines: null,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Nombre completo",
            ),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPhone() {
    return const Column(
      children: [
        SizedBox(height: 30),
        Text(
          "Número telefónico",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            keyboardType: TextInputType.phone,
            maxLength: 10,
            maxLines: null,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Número telefónico",
            ),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBirthdate() {
    return Column(
      children: [
        const SizedBox(height: 30),
        const Text(
          "Fecha de nacimiento",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            controller: birthdateController,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.phone,
            readOnly: true,
            onTap: () => _selectBirthDate(),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Fecha de nacimiento",
            ),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGender() {
    return Column(
      children: [
        const SizedBox(height: 30),
        const Text(
          "Sexo",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                child: RadioListTile<String>(
                  title: const Text('Masculino'),
                  groupValue: gender,
                  value: "Masculino",
                  onChanged: (String? value) {
                    setState(() {
                      gender = value!;
                    });
                  },
                ),
              ),
              Expanded(
                child: RadioListTile<String>(
                  title: const Text('Femenino'),
                  groupValue: gender,
                  value: "Femenino",
                  onChanged: (String? value) {
                    setState(() {
                      gender = value!;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildColor() {
    return Column(
      children: [
        const SizedBox(height: 30),
        const Text(
          "Color favorito",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: MultiSelectDropDown(
            controller: selectController,
            onOptionSelected: (options) {},
            options: const <ValueItem>[
              ValueItem(label: 'Azul', value: 'Azul'),
              ValueItem(label: 'Rojo', value: 'Rojo'),
              ValueItem(label: 'Amarillo', value: 'Amarillo'),
              ValueItem(label: 'Verde', value: 'Verde'),
              ValueItem(label: 'Morado', value: 'Morado'),
              ValueItem(label: 'Naranja', value: 'Naranja'),
            ],
            maxItems: 5,
            selectionType: SelectionType.multi,
            chipConfig: const ChipConfig(wrapType: WrapType.wrap),
            dropdownHeight: 300,
            optionTextStyle: const TextStyle(fontSize: 16),
            selectedOptionIcon: const Icon(Icons.check_circle),
          ),
        ),
        const SizedBox(height: 50)
      ],
    );
  }

  Future<void> _selectBirthDate() async {
    DateTime? selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2025),
    );

    if (selected != null) {
      setState(() {
        birthdateController.text = formatDate.format(selected);
      });
    }
  }
}
