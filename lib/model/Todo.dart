class Todo {

  int id;
  String title;
  bool completed;

  Todo({required this.id, required this.title, required this.completed});

  Todo.fromJson(Map<String, dynamic> json):
        this.id = json['id'], this.title = json['title'], this.completed = json['completed'];


}