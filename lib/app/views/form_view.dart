import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/app/controllers/view_form_controller.dart';

class FormView extends StatefulWidget {
  const FormView({Key? key}) : super(key: key);

  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  late String title = '';
  late String description = '';
  var date = {'day': '', 'month': '', 'year': ''};
  late bool validate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notas'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width - 10,
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    title = value;
                  });
                },
                decoration: const InputDecoration(
                  label: Text('title'),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 114, 86, 3))),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 114, 86, 3))),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 10,
              child: DropdownDatePicker(
                textStyle: const TextStyle(color: Colors.white),
                inputDecoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 114, 86, 3))),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 114, 86, 3))),
                ),
                isDropdownHideUnderline: true,
                isFormValidator: true,
                startYear: 2023,
                endYear: 2025,
                dayFlex: 2,
                monthFlex: 3,
                yearFlex: 3,
                onChangedDay: (value) => setState(() {
                  date['day'] = value.toString();
                }),
                onChangedMonth: (value) => setState(() {
                  date['month'] = value.toString();
                }),
                onChangedYear: (value) => setState(() {
                  date['year'] = value.toString();
                }),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 10,
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    description = value;
                  });
                },
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  label: Text('descrição'),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 114, 86, 3))),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 114, 86, 3))),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              validate == false ? '' : 'preencha todos os capos',
              style: const TextStyle(color: Colors.red),
            ),
            TextButton.icon(
              onPressed: () {
                if (title.isNotEmpty &&
                    date.isNotEmpty &&
                    description.isNotEmpty) {
                  var id = ViewFormController.instance.todo.length;
                  ViewFormController.instance.changeTodo({
                    'id': id.toString(),
                    'title': title,
                    'date': '${date['day']}/${date['month']}/${date['year']}',
                    'description': description,
                    'verified': false
                  });
                  Navigator.pop(context);
                } else {
                  setState(() {
                    validate = true;
                  });
                }
              },
              label: const Text('adicionar'),
              icon: const Icon(Icons.add_circle),
            )
          ],
        ),
      ),
    );
  }
}
