import 'package:flutter/material.dart';
import '../controllers/view_form_controller.dart';

class Cards extends StatefulWidget {
  final int index;
  const Cards({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  _CardsState createState() => _CardsState(index: index);
}

class _CardsState extends State<Cards> {
  final int index;
  _CardsState({required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(ViewFormController.instance.todo[index]['title'].toString()),
              Text(ViewFormController.instance.todo[index]['date'].toString())
            ],
          ),
        ),
        ViewFormController.instance.todo[index]['verified']
            ? Expanded(
                flex: 1,
                child: IconButton(
                  onPressed: () {
                    ViewFormController.instance.deletById(
                        ViewFormController.instance.todo[index]['id']);
                  },
                  icon: const Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                  ),
                ))
            : Expanded(
                flex: 1,
                child: IconButton(
                  onPressed: () {
                    ViewFormController.instance.changeVerified(
                        ViewFormController.instance.todo[index]['id']);
                  },
                  icon: Icon(Icons.check_sharp, color: Colors.green),
                ))
      ]),
    );
  }
}
