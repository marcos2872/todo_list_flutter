import 'package:flutter/material.dart';
import 'package:todo_list/app/components/cards.dart';
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
                      ? const Center(
                          child: Text(
                          'Nenhuma nota existente',
                          style: TextStyle(fontSize: 20),
                        ))
                      : Cards(index: index);
                },
                separatorBuilder: (context, index) => const Divider(),
              )),
    );
  }
}
