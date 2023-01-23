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

class Task extends StatefulWidget {
  final String nome;
  const Task(this.nome,{Key? key}) : super(key: key);

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
            color: Colors.amber,
            height: 140,
          ),
          Column(
            children: [
              Container(
                color: Colors.black,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Image.asset("images/lion.png"),
                      color: Colors.grey,
                      width: 72,
                      height: 100,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 200,
                              child:
                              Text(
                                widget.nome,
                                style:
                                const TextStyle(
                                    fontSize: 24,
                                    overflow: TextOverflow.ellipsis ),)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(

                            children: [
                              Icon(Icons.star, size: 15,color: Colors.amber[100],),
                              Icon(Icons.star, size: 15,color: Colors.amber[100],),
                              Icon(Icons.star, size: 15,color: Colors.amber[100],),
                              Icon(Icons.star, size: 15,color: Colors.amber[100],),
                              Icon(Icons.star, size: 15,color: Colors.amber[100],),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 52,
                      height: 52,
                      child: ElevatedButton(
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.amber),),
                          onPressed: (){
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
                    child: Container(
                      width: 200,
                      child: LinearProgressIndicator(
                        color: Colors.white,
                        value: nivel/10,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Nivel $nivel", style: TextStyle(fontSize: 20),),
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

