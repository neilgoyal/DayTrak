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
