
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget{

  int nombre;

  SecondPage({required this.nombre});



  @override
  Widget build(BuildContext context) {
    //int arg = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(
        title: Text("Seconde page"),
      ),
        body: Center(
        child: Text("Ceci est la seconde page $arg"),
      ),
    );
  }
}