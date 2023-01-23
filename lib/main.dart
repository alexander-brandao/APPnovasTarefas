import 'package:capacitacao/tarefas.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Tarefas",
    theme: ThemeData.dark(),
    home: Tarefas(),
  ));
}

