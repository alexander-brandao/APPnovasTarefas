import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {

  final _nome = TextEditingController();
  final _dificuldade = TextEditingController();
  final _imagem = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nova Tarefa"),
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: Container(
          height: 700,
          width: 375,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 3),
          ),
          child: Column(
            children:  [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _nome,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Nome',
                    fillColor: Colors.black,
                    filled: true,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _dificuldade,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Dificuldade',
                    fillColor: Colors.black,
                    filled: true,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (text){
                    setState(() {

                    });
                  },
                  controller: _imagem,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Imagem',
                    fillColor: Colors.black,
                    filled: true,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 2, color: Colors.amber)
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    _imagem.text,
                    fit: BoxFit.cover,
                    errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace){
                      return const Icon(Icons.no_photography);
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: (){},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.amber),
                    foregroundColor: MaterialStateProperty.all(Colors.black)
                ),
                  child: const Text("Adiciaonar"),

              )
            ],
          ),
        ),
      ),
    );
  }
}
