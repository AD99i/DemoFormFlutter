import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Demo form'),
          ),
          body: MyFormPage()),
    );
  }
}

class MyFormPage extends StatefulWidget {

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _key = GlobalKey<FormState>();

  bool _switchValue = false;
  int? _dropDownValue;
  int? _dropDownMenuValue;
  String? _email;



  _onSwitchChanged(value) {
    setState(() {
      _switchValue = value;
    });
  }

  void _onSubmit(){
    if (_key.currentState!.validate()){
      _key.currentState!.save();
      print("Form valid : ${_email}");
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child:  Form(
        key: _key,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Veuillez saisir votre email',
                border: OutlineInputBorder()
              ),
              validator: (value) {
                if(value!.isEmpty){
                  return "Remplis moi ce champ !";
                }
                if(!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)){
                  return "Email non valide";
                }
                return null;
              },
              onSaved: (value){
                setState(() {
                  _email = value;
                });
              },
              obscureText:true,
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Veuillez saisir votre mot de passe',
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 16),
            DropdownButton(
                value: _dropDownValue,
                items: const [
                  DropdownMenuItem(child: Text("Option 1"), value: 1),
                  DropdownMenuItem(child: Text("Option 2"), value: 2)
                ],
                onChanged: (value){
                  setState(() {
                    _dropDownValue = value;
                  });
                }),
            SizedBox(height: 16,),
            DropdownMenu(
                initialSelection: _dropDownMenuValue,
                dropdownMenuEntries: const [
                  DropdownMenuEntry(value: 1, label: "Option 1"),
                  DropdownMenuEntry(value: 2, label: "Option 2"),
                  DropdownMenuEntry(value: 3, label: "Option 3"),
                ],
                onSelected: (value) {
                  setState(() {
                    _dropDownMenuValue = value;
                  });
                }),
            SwitchListTile(
              title: Text("RGPD"),
                secondary: Icon(Icons.privacy_tip),
                value: _switchValue,
                onChanged: _onSwitchChanged),
            ElevatedButton(
              onPressed: _onSubmit,
              child: Text("Soumettre"),
            ),
            SizedBox(height: 16,),

          ],

        ),
      ),
    );
  }
}