import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_list/controllers/view_form_controller.dart';

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
                  return Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(ViewFormController.instance.todo.isEmpty
                        ? 'Nenhuma nota existente'
                        : ViewFormController.instance.todo[0]['title']
                            as String),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
              )),
    );
  }
}
