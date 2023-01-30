import 'package:flutter/material.dart';

import 'form_screen.dart';

class Tarefas extends StatefulWidget {
  const Tarefas({Key? key}) : super(key: key);

  @override
  State<Tarefas> createState() => TarefasState();
}

class TarefasState extends State<Tarefas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tarefas"),
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
      ),
      body: ListView(
        children: const [
          Task("APP Leaozinho", 5),
          Task("Fera no Flutter", 2),
          Task("Surfar no Java", 3),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FormScreen()),
          );
        },
        backgroundColor: Colors.amber,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Task extends StatefulWidget {
  final String nome;
  final int dificuldade;

  const Task(this.nome, this.dificuldade, {Key? key}) : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: Colors.amber,
            ),
          ),
          Column(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.black,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.grey,
                      ),
                      width: 72,
                      height: 100,
                      child: Image.asset("images/lion.png"),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                              width: 200,
                              child: Text(
                                widget.nome,
                                style: const TextStyle(
                                    fontSize: 24,
                                    overflow: TextOverflow.ellipsis),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(Icons.star,
                                  size: 15,
                                  color: (widget.dificuldade >= 1)
                                      ? Colors.amber
                                      : Colors.amber[100]),
                              Icon(Icons.star,
                                  size: 15,
                                  color: (widget.dificuldade >= 2)
                                      ? Colors.amber
                                      : Colors.amber[100]),
                              Icon(Icons.star,
                                  size: 15,
                                  color: (widget.dificuldade >= 3)
                                      ? Colors.amber
                                      : Colors.amber[100]),
                              Icon(Icons.star,
                                  size: 15,
                                  color: (widget.dificuldade >= 4)
                                      ? Colors.amber
                                      : Colors.amber[100]),
                              Icon(Icons.star,
                                  size: 15,
                                  color: (widget.dificuldade >= 5)
                                      ? Colors.amber
                                      : Colors.amber[100]),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 52,
                      height: 52,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.amber),
                          ),
                          onPressed: () {
                            setState(() {
                              nivel++;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Icon(Icons.arrow_drop_up),
                              Text("UP"),
                            ],
                          )),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        color: Colors.white,
                        value: (widget.dificuldade > 0)
                            ? (nivel / widget.dificuldade) / 10
                            : 1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Nivel $nivel",
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
