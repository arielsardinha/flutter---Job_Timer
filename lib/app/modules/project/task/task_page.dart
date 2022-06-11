import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_time/app/core/ui/button_with_loader.dart';
import 'package:job_time/app/modules/project/task/controller/task_controller.dart';
import 'package:job_time/app/view_models.dart/project_model.dart';
import 'package:validatorless/validatorless.dart';

class TaskPage extends StatefulWidget {
  final TaskController controller;
  const TaskPage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final _nameEC = TextEditingController();
  final _durationEC = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _durationEC.dispose();
    _nameEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: widget.controller,
      listener: (context, state) {
        if (state == TaskStatus.success) {
          Navigator.pop(context);
        } else if (state == TaskStatus.failure) {
          AsukaSnackbar.alert("Erro ao salvar task").show();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Criar nova task'),
          backgroundColor: Colors.white,
          titleTextStyle: const TextStyle(color: Colors.black),
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _nameEC,
                  validator: Validatorless.required('Nome obrigatório'),
                  decoration: const InputDecoration(
                    label: Text('Nome da task'),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _durationEC,
                  validator: Validatorless.multiple([
                    Validatorless.required('Duração obrigatória'),
                    Validatorless.number('Somente números')
                  ]),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: const InputDecoration(
                    label: Text('Duração da task'),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 49,
                  child: ButtonWithLoad<TaskController, TaskStatus>(
                    bloc: widget.controller,
                    selector: (state) => state == TaskStatus.loading,
                    onPressed: () {
                      final formValid =
                          _formKey.currentState?.validate() ?? false;

                      if (formValid) {
                        final duration = int.parse(_durationEC.text);
                        widget.controller.register(_nameEC.text, duration);
                      }
                    },
                    label: 'Salvar',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
