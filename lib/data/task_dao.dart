
import 'package:capacitacao/data/database.dart';
import 'package:sqflite/sqflite.dart';

import '../components/task.dart';

class TaskDao{
  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT)';

  static const String _tableName = 'taskTable';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';

  //converte uma tarefa em mapa
  Map<String,dynamic> toMap(Task tarefa){
    print('Convertendo Tarefa em Map:');
    final Map<String,dynamic> mapaDeTarefas = Map();
    mapaDeTarefas[_name] = tarefa.nome;
    mapaDeTarefas[_difficulty] = tarefa.dificuldade;
    mapaDeTarefas[_image] = tarefa.foto;
    print('\n Mapa de Taarefas: $mapaDeTarefas');
    return mapaDeTarefas;
  }

  save(Task tarefa)async {
    print('Iniciando o save: ');
    final Database db = await getDatabase();
    var itemExists = await find(tarefa.nome);
    Map<String,dynamic> taskMap = toMap(tarefa);
    if(itemExists.isEmpty){
      print('A tarefa não existia.');
      return await db.insert(_tableName, taskMap);
    } else {
      print('A tarefa já existia.');
      return await db.update(
          _tableName,
          taskMap,
          where: '$_name = ?',
          whereArgs: [tarefa.nome]
      );
    }

  }

  Future<List<Task>> findAll() async{
    print(" Acessando FindAll: ");
    final Database db = await getDatabase();
    final List<Map<String , dynamic>> result = await db.query(_tableName);
    print(" Procurando Banco de Dados... encontrado: $result ");
    return toList(result);
  }

  //retorna uma lista de tarefas
  List<Task> toList(List<Map<String, dynamic>> mapaDeTarefas){
    print(' Convertendo to List: ');
    final List<Task> tarefas = [];
    for (Map<String, dynamic> linha in mapaDeTarefas){
      final Task tarefa = Task(linha[_name],linha[_difficulty],linha[_image]);
      tarefas.add(tarefa);
    }
    print(" Lista de Tarefas: $tarefas");
    return tarefas;
  }

  Future<List<Task>> find(String nomeDaTarefa) async {
    print(' Acessando find: ');
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(
      _tableName,
      where: '$_name = ?',
      whereArgs: [nomeDaTarefa],
    );
    print('Tarefa encontrado: ${toList(result)}');
    return toList(result);
  }

  delete(String nomeDaTarefa) async{
    print('Deletando a tarefa');
    final Database db = await getDatabase();
    return db.delete(
        _tableName,
        where:'$_name = ?',
        whereArgs: [nomeDaTarefa]
    );
  }
}