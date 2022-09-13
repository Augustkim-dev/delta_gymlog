import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Gym_Add extends StatelessWidget {
  Gym_Add({Key? key}) : super(key: key);

  TextEditingController date_controller = new TextEditingController();
  TextEditingController content_controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Gym'),
      ),
      body: Column(children: [
        TextField(
          controller: date_controller,
          keyboardType: TextInputType.text,
        ),
        TextField(
          controller: content_controller,
          keyboardType: TextInputType.text,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Save')),
      ]),
    );
  }
}
