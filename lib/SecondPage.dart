
import 'package:flutter/material.dart';

import 'model/Todo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SecondPage extends StatefulWidget{

  int nombre;

  SecondPage({required this.nombre});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

 List<Todo> todos= [];
  Future<void> _apiCall() async {
    late List<Todo> todos = [];

    String uri = 'https://jsonplaceholder.typicode.com/users/1/todos';
    var response = await http.get(Uri.parse(uri));

    if (response.statusCode == 200) {
      setState(() {
        todos = List<Todo>.from(jsonDecode(response.body)
            .map((data) => Todo.fromJson(data))
            .toList());
      });
    }
  }

  @override
  void initState(){
    super.initState();
    _apiCall();
  }

  @override
  Widget build(BuildContext context) {
    //int arg = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(
        title: Text("Seconde page"),
      ),
        body: Column(
          children: [
            Center(
            child: Text("Ceci est la seconde page ${widget.nombre}"),
                  ),
            ElevatedButton(onPressed: _apiCall, child: Text('Call API')),
            Expanded(
              child: ListView.builder(
                  itemCount: todos?.length,
                  itemBuilder: (BuildContext context, int index){
                    return ListTile(
                      title: Text(todos[index].title ??''),
                      leading: todos[index].completed ? Icon(Icons.check) : Icon(Icons.clear_rounded),
                    );
                  }),
            )
          ],
        ),
    );
  }
}