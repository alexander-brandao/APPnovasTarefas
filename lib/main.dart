import 'package:capacitacao/screens/tarefas.dart';
import 'package:flutter/material.dart';

import 'data/task_inherited.dart';
import 'screens/form_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Tarefas",
    theme: ThemeData.dark(),
    home: TaskInherited(child: const Tarefas(),),
  ));
}

