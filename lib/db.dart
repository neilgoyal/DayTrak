import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class Todo {
  int id;
  String title, todoDate;

  todoMap() {
    Map<String, dynamic> mapping = Map<String, dynamic>();
    mapping['id'] = id;
    mapping['title'] = title;
    mapping['todoDate'] = todoDate;

    return mapping;
  }
}

class TodoService {
  Repository _repository;

  TodoService() {
    _repository = Repository();
  }
  saveTodo(Todo todo) async {
    return await _repository.insertData('todos', todo.todoMap());
  }

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

class Repository {
  DatabaseConnection _databaseConnection;

  Repository() {
    _databaseConnection = DatabaseConnection();
  }
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _databaseConnection.setDatabase();
    return _database;
  }

  insertData(table, data) async {
    Database connection = await database;
    return await connection.insert(table, data);
  }

  readData(table) async {
    Database connection = await database;
    return await connection.query(table, orderBy: 'todoDate ASC');
  }

  readDataById(table, itemId) async {
    Database connection = await database;
    return await connection.query(table, where: 'id=?', whereArgs: [itemId]);
  }

  updateData(table, data) async {
    Database connection = await database;
    return await connection
        .update(table, data, where: 'id=?', whereArgs: [data['id']]);
  }

  deleteData(table, itemId) async {
    Database connection = await database;
    return await connection.rawDelete("DELETE FROM $table WHERE id = $itemId");
  }

  readDataByColumnName(table, columnName, columnValue) async {
    Database connection = await database;
    return await connection
        .query(table, where: '$columnName=?', whereArgs: [columnValue]);
  }
}

class DatabaseConnection {
  setDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'db_todolist_sqflite');
    Database database =
        await openDatabase(path, version: 1, onCreate: _onCreatingDatabase);
    return database;
  }

  _onCreatingDatabase(Database database, int version) async {
    await database.execute(
        "CREATE TABLE todos(id INTEGER PRIMARY KEY, title TEXT, todoDate TEXT)");
  }
}
