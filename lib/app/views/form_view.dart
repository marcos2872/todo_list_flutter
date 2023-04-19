import 'package:flutter/material.dart';
import 'package:todo_list/controllers/view_form_controller.dart';

class FormView extends StatefulWidget {
  const FormView({Key? key}) : super(key: key);

  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  late String title = '';
  late String description = '';
  late String date = '';
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
              width: MediaQuery.of(context).size.width - 60,
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
              width: MediaQuery.of(context).size.width - 60,
              child: TextField(
                keyboardType: TextInputType.datetime,
                onChanged: (value) {
                  setState(() {
                    date = value;
                  });
                },
                decoration: const InputDecoration(
                  label: Text('data'),
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
              width: MediaQuery.of(context).size.width - 60,
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
              // style: const TextStyle(color: Colors.red),
            ),
            TextButton.icon(
              onPressed: () {
                if (title.isNotEmpty &&
                    date.isNotEmpty &&
                    description.isNotEmpty) {
                  var id = ViewFormController.instance.todo.length;
                  ViewFormController.instance.changeTodo({'id': id.toString(), 'title': title, 'data': date, 'description': description});
                  Navigator.of(context).popAndPushNamed('/');
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
