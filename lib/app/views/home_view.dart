import 'package:flutter/material.dart';
import 'package:todo_list/app/controllers/view_form_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 48, 48, 48),
      appBar: AppBar(
        title: const Text('Notas'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/form');
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: AnimatedBuilder(
          animation: ViewFormController.instance,
          builder: (context, child) => ListView.separated(
                padding: const EdgeInsets.all(8),
                itemCount: ViewFormController.instance.todo.isEmpty
                    ? 1
                    : ViewFormController.instance.todo.length,
                itemBuilder: (context, index) {
                  return ViewFormController.instance.todo.isEmpty
                      ? const Text('Nenhuma nota existente')
                      : Row(children: [
                          Expanded(
                            flex: 5,
                            child: Text(ViewFormController.instance.todo[index]
                                ['title'] as String),
                          ),
                          Expanded(
                              flex: 1,
                              child: IconButton(
                                onPressed: () {
                                  ViewFormController.instance.changeVerified(
                                      ViewFormController.instance.todo[index]['id']);
                                },
                                icon: Icon(
                                  Icons.verified,
                                  color: ViewFormController.instance.todo[index]
                                          ['verified']
                                      ? Colors.green
                                      : Colors.red,
                                ),
                              ))
                        ]);
                },
                separatorBuilder: (context, index) => const Divider(),
              )),
    );
  }
}
