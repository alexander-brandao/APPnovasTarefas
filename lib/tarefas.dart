import 'package:flutter/material.dart';

class Tarefas extends StatefulWidget {
   const Tarefas({Key? key}) : super(key: key);


  @override
  State<Tarefas> createState() => _TarefasState();
}

class _TarefasState extends State<Tarefas> {
   bool _opacidade = true;
   late bool _olho = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tarefas"),
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
      ),
      body:  AnimatedOpacity(
        opacity: _opacidade ? 1 :0,
        duration: const Duration(milliseconds: 800),
        child: ListView(
          children: const [
            Task("APP Leaozinho", 5),
            Task("Fera no Flutter", 2),
            Task("Surfar no Java", 3),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if(_olho){
            setState(() {
              _olho = false;
              _opacidade = false;
            });
          } else{
            setState(() {
              _olho = true;
              _opacidade = true;
            });
          }
        },
        backgroundColor: Colors.amber,
        child: Icon((_olho == true) ?Icons.remove_red_eye_outlined : Icons.lock),),
    );
  }
}

class Task extends StatefulWidget {
  final String nome;
  final int dificuldade;
  const Task(this.nome, this.dificuldade,{Key? key}) : super(key: key);

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
                              Icon(Icons.star, size: 15,color: (widget.dificuldade >= 1)? Colors.amber : Colors.amber[100]),
                              Icon(Icons.star, size: 15,color: (widget.dificuldade >= 2)? Colors.amber : Colors.amber[100]),
                              Icon(Icons.star, size: 15,color: (widget.dificuldade >= 3)? Colors.amber : Colors.amber[100]),
                              Icon(Icons.star, size: 15,color: (widget.dificuldade >= 4)? Colors.amber : Colors.amber[100]),
                              Icon(Icons.star, size: 15,color: (widget.dificuldade >= 5)? Colors.amber : Colors.amber[100]),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
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
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        color: Colors.white,
                        value: (widget.dificuldade > 0) ? (nivel/widget.dificuldade)/10 : 1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Nivel $nivel", style: const TextStyle(fontSize: 20),),
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

