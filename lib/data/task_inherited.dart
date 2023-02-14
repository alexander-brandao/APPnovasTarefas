import 'package:flutter/material.dart';
import '../components/task.dart';

class TaskInherited extends InheritedWidget {
   TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

   final List<Task> taskList = [
     Task("APP Leaozinho", 5, "https://www.infoescola.com/wp-content/uploads/2017/04/leao-126767138.jpg"),
     Task("Fera no Flutter", 2, "https://cdn-images-1.medium.com/max/1200/1*5-aoK8IBmXve5whBQM90GA.png"),
     Task("Surfar no Java", 3, "http://dicasdejava.com.br/images/logo-java.png"),
   ];

   void newTask(String name, int difficulty, String photo){
      taskList.add(Task(name, difficulty, photo));
   }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited old) {
    return old.taskList.length != taskList.length;
  }
}
