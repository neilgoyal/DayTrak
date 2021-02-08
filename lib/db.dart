import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class Todo {
  int id;
  String title;
  String todoDate;

  todoMap() {
    var mapping = Map<String, dynamic>();
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

class Repository {
  DatabaseConnection _databaseConnection;

  Repository() {
    // initialize database connection
    _databaseConnection = DatabaseConnection();
  }

  static Database _database;

  // Check if database is exist or not
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _databaseConnection.setDatabase();
    return _database;
  }

  // Inserting data to Table
  insertData(table, data) async {
    var connection = await database;
    return await connection.insert(table, data);
  }

  // Read data from Table
  readData(table) async {
    var connection = await database;
    return await connection.query(table, orderBy: 'todoDate');
  }

  // Read data from table by Id
  readDataById(table, itemId) async {
    var connection = await database;
    return await connection.query(table, where: 'id=?', whereArgs: [itemId]);
  }

  // Update data from table
  updateData(table, data) async {
    var connection = await database;
    return await connection
        .update(table, data, where: 'id=?', whereArgs: [data['id']]);
  }

  // Delete data from table
  deleteData(table, itemId) async {
    var connection = await database;
    return await connection.rawDelete("DELETE FROM $table WHERE id = $itemId");
  }

  // Read data from table by Column Name
  readDataByColumnName(table, columnName, columnValue) async {
    var connection = await database;
    return await connection
        .query(table, where: '$columnName=?', whereArgs: [columnValue]);
  }
}

class DatabaseConnection {
  setDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'db_todolist_sqflite');
    var database =
        await openDatabase(path, version: 1, onCreate: _onCreatingDatabase);
    return database;
  }

  _onCreatingDatabase(Database database, int version) async {
    await database
        .execute("CREATE TABLE categories(id INTEGER PRIMARY KEY, name TEXT)");

    // Create table todos
    await database.execute(
        "CREATE TABLE todos(id INTEGER PRIMARY KEY, title TEXT, todoDate TEXT)");
  }
}
