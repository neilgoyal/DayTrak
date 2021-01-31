import 'package:schoolcalendar/repositories/repository.dart';
import 'package:schoolcalendar/models/todo.dart';

class TodoService {
  Repository _repository;

  TodoService() {
    _repository = Repository();
  }

  // create todos
  saveTodo(Todo todo) async {
    return await _repository.insertData('todos', todo.todoMap());
  }

  // read todos
  readTodos() async {
    return await _repository.readData('todos');
  }

  deleteTodo(itemId) async {
    return await _repository.deleteData('todos', itemId);
  }

  updateTodo(Todo todo) async {
    return await _repository.updateData('todos', todo.todoMap());
  }
}
