import 'package:flutter/material.dart';

class Tarefas extends StatefulWidget {
  const Tarefas({Key? key}) : super(key: key);

  @override
  State<Tarefas> createState() => _TarefasState();
}

class _TarefasState extends State<Tarefas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tarefas"),
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
      ),
      body:  ListView(
        children: [
          Task("APP Leaozinho"),
          Task("Fera no Flutter"),
          Task("Surfar no Java"),
        ],
      ),
    );
  }
}

class Task extends StatelessWidget {
  final String nome;
  const Task(this.nome,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            color: Colors.amber,
            height: 140,
          ),
          Container(
            color: Colors.white,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: Colors.black26,
                  width: 72,
                  height: 100,
                ),
                Container(
                  width: 200,
                    child:
                    Text(
                      nome,
                      style:
                      const TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          overflow: TextOverflow.ellipsis ),)),
                ElevatedButton(onPressed: (){}, child: const Icon(Icons.arrow_drop_up))
              ],
            ),
          )
        ],
      ),
    );
  }
}

